require 'spec_helper'

describe Phone do
  it "does not allow duplicate phone numbers per contcact" do
    contact = Contact.create(firstname: 'Joe', lastname: 'Tester', email: 'joe@joetester.com')
    contact.phones.create(phone_type: 'home', phone: '555-555-5555')
    mobile_phone = contact.phones.build(phone_type: 'mobile', phone: '555-555-5555')

    expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it "allows two contacts to share a phone number" do
    contact = Contact.create(firstname: 'Joe', lastname: 'Tester', email: 'joe@testerr.com')
    contact.phones.create(phone_type: 'home', phone: '555-555-5555')
    other_contact = Contact.new
    other_phone = other_contact.phones.build(phone_type: 'home', phone: '555-555-5555')

    expect(other_phone).to be_valid
  end
end