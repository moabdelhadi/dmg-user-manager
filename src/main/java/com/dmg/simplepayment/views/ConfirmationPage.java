package com.dmg.simplepayment.views;

import com.vaadin.navigator.Navigator;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.server.Sizeable.Unit;
import com.vaadin.shared.ui.MarginInfo;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.Component;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.VerticalLayout;

public class ConfirmationPage extends VerticalLayout implements View {

	private FormLayout form = new FormLayout();

	/** Login Fileds **/
	private Label name;
	private Button action;

	private Navigator navigator;

	public ConfirmationPage(Navigator navigator) {
		this.navigator = navigator;
		setWidth(600, Unit.PIXELS);
		init();

	}


	private void init() {

		name = new Label("Confirmation Page, it would be success, or fail message with go to login");
		action = new Button("go to Login page");
		action.addClickListener(new ClickListener() {

			private static final long serialVersionUID = 1L;

			@Override
			public void buttonClick(ClickEvent event) {
				System.out.println("Confirmation Page");
				navigator.navigateTo(Views.USER_PAGE);
			}
		});

		form.setMargin(new MarginInfo(true, false, false, true));
		form.addComponent(name);
		form.addComponent(action);
		addComponent(form);
		

	}

	@Override
	public void enter(ViewChangeEvent event) {
		// TODO Auto-generated method stub
	}

}
