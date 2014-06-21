package com.dmg.simplepayment.views;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.dmg.simplepayment.beans.Bill;
import com.dmg.simplepayment.beans.UserAccount;
import com.dmg.simplepayment.beans.UserStatus;
import com.dmg.util.EncryptionUtil;
import com.dmg.util.Logger;
import com.vaadin.data.Validator.InvalidValueException;
import com.vaadin.data.validator.EmailValidator;
import com.vaadin.event.ShortcutAction.KeyCode;
import com.vaadin.navigator.Navigator;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.server.UserError;
import com.vaadin.shared.ui.MarginInfo;
import com.vaadin.shared.ui.label.ContentMode;
import com.vaadin.ui.AbstractField;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.Notification.Type;
import com.vaadin.ui.themes.Runo;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.Component;
import com.vaadin.ui.CustomLayout;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.Notification;
import com.vaadin.ui.PasswordField;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;

public class AccountOverview extends VerticalLayout implements View {

	private Navigator navigator;

	/** Login Fileds **/
	private Button payButton;

	private UserAccount user;
	
	private Label name;
	List<Label> dates =  new ArrayList<Label>();
	List<Label> amounts =  new ArrayList<Label>();
	List<Label> billViews =  new ArrayList<Label>();
	
	
	public AccountOverview(Navigator navigator) {
		this.navigator = navigator;
		init();
	}

	private void init() {

		setSizeFull();
		CustomLayout customLayout = new CustomLayout("AccountOverview");
		// customLayout.setWidth("20%");
		
		name = new Label("");
		name.setStyleName("h1");
		customLayout.addComponent(name, "welcomeName");


		int counter =0;

		dates.clear();
		amounts.clear();
		billViews.clear();
		
		for (int i=0; i<3; i++) {
			
 			Label date = new Label("..."+counter);
			customLayout.addComponent(date, "date_"+counter);
			dates.add(date);

			Label amount = new Label("....."+counter);
			customLayout.addComponent(amount, "amount_"+counter);
			amounts.add(amount);
			
			Label link = new Label("....."+counter);
			customLayout.addComponent(link, "view_"+counter);
			billViews.add(link);
			
			counter++;
			
		}

		
		
		
		Label totalAmount = new Label("Ammount Due date: "+ " ??? " +" AED");
		customLayout.addComponent(totalAmount, "totalAmount");

		//payButton
		
		
		payButton = new Button("Pay Online");
		payButton.addStyleName(Runo.BUTTON_BIG);
		customLayout.addComponent(payButton, "payButton");


		addComponent(customLayout);

		payButton.addClickListener(new ClickListener() {

			@Override
			public void buttonClick(ClickEvent event) {
				Logger.info(this, "Pay on process");
			}
		});

	}


	@Override
	public void enter(ViewChangeEvent event) {
		
		Logger.debug(this, "Get in Edit Account Overview View");

		String parametersString = event.getParameters();
		Logger.debug(this, "Parameters=" + parametersString);

		String[] parameters = parametersString.split("/");

		if (parameters == null || parameters.length != 2) {
			Logger.error(this, "No Paratemeres Passed to this user or Parameters are error ");
			return;
		}

		if (StringUtils.isEmpty(parameters[0]) || StringUtils.isEmpty(parameters[1])) {
			Logger.error(this, "Paratemeres Value is in correct " + parameters[0] + " , " + parameters[1]);
			return;
		}

		UserAccount userAccount = new UserAccount();
		userAccount.setContractNo(parameters[0]);
		userAccount.setCity(parameters[1]);
		UserAccount accountFromAccountID = UserManager.getInstance().getAccountFromAccountID(userAccount);

		if (accountFromAccountID == null) {
			Logger.error(this, "No Valid user with this parameter");
			return;
		}
		user = accountFromAccountID;
		
		name.setValue(user.getName());
		 

		List<Bill> list = BillManager.getInstance().getLatestBills(user.getContractNo());
		
		int counter = 0;
		for (Bill bill : list) {
			
			dates.get(counter).setValue(bill.getCurrentReadingDate().toString());
			amounts.get(counter).setValue(bill.getTotalAmount());
			billViews.get(counter).setValue(bill.getContractNo());
			counter++;
			if(counter>=3){
				break;
			}
			
		}
	}

}
