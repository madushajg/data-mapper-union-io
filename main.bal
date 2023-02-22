type Input record {
    string userId;
    ContactMediumItem contactMedium;
};

type Output record {
    string id;
    ContactMediumOut contctMedium;
};

type ContactMediumEmail record {
    string mediumType = "EMAIL";
    EmailCharacteristic characteristic;
};

type ContactMediumTelephone record {
    string mediumType = "TELEPHONE";
    TelephoneCharacteristic characteristic;
};

type ContactMediumPostal record {
    string mediumType = "POSTAL_ADDRESS";
    PostalCharacteristic characteristic;
};

type EmailCharacteristic record {
    string emailAddress;
};

type TelephoneCharacteristic record {
    string phoneNumber;
};

type PostalCharacteristic record {
    string city;
    string country;
    string postCode;
    string street1;
    string name;
};

type ContactMediumItem ContactMediumEmail|ContactMediumTelephone|ContactMediumPostal;

type ContactMediumOut Email|Phone|PostalAddress|string;

type Email record {
    string contactEmail;
};

type Phone record {
    string contactPhone;
};

type PostalAddress record {
    string contactPhone;
    string address1;
    string name;
    string city;
    string zip;
    string country;
};

function transform(Input input) returns Output => {
    id: input.userId,
    contctMedium: {
        contactEmail: (<ContactMediumEmail>input.contactMedium).characteristic.emailAddress
    }
};
