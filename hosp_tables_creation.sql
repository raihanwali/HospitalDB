drop database hospitaldb;
create database hospitaldb;
\c hospitaldb;

create table patient(
        aadhar varchar(12),
        name varchar(10),
        age int,
        contact_no int,
        address varchar(100),
        eme_contact int,
        primary key(aadhar));

create table med_history(
            aadhar varchar(12),
            wbc int,
            rbc int,
            cholestrol int,
            sugar int,
            bp int,
            primary key(aadhar),
        foreign key(aadhar) references patient(aadhar));

create table employee(
                employee_id int,
                name varchar(100),
                age int,
                date_of_birth date,
                address varchar(100),
                contact int,
                works_us varchar(20),
                fees int,
                designation varchar(100),
                type varchar(100),
                primary key(employee_id));



create table lab(
            lab_id int,
            lab_name varchar(100),
            incharge_id int,
            contact_no int,
            primary key(lab_id),
            foreign key(incharge_id) references employee(employee_id)
        );

create table report(
        lab_id int,
        aadhar varchar(12),
        doc_id int,
        report_date date,
        charge int,
        report_id int,
        primary key(aadhar,report_id),
    foreign key(aadhar) references patient(aadhar),
    foreign key(doc_id) references employee(employee_id),
    foreign key(lab_id) references lab(lab_id));

    create table room(
        room_id int,
        type varchar(100),
        charge int,
        status varchar(100),
        facilities varchar(100),
    primary key(room_id));

create table in_patient(
    patient_id varchar(12),
    date_of_admission date,
    date_of_discharge date,
    room_id int,
    doc_id int,
    primary key(patient_id),
foreign key(patient_id) references patient(aadhar),
foreign key(room_id) references room(room_id),
foreign key(doc_id) references employee(employee_id));

create table in_patient_bill(
                bill_id int,
                bill_date date,
                patient_id varchar(12),
                doc_fee int,
                room_charge int,
                med_charge int,
                VAT int,
                total int,
            primary key(patient_id,bill_id),
            foreign key(patient_id) references in_patient(patient_id));

create table out_patient(
        patient_id varchar(12),
        doc_id int,
        checkup_date date,
        primary key(aadhar),
    foreign key(doc_id) references employee(employee_id),
foreign key(aadhar) references patient(aadhar));

create table out_patient_bill(
        bill_date date,
        bill_id int,
        patient_id varchar(12),
        doc_fee int,
        med_charge int,        
        VAT int,        
        total int,
        primary key(patient_id,bill_id),
foreign key(patient_id) references out_patient(patient_id));




create table doc_fee(doc_id int,
                     fee int,
    primary key(doc_id),
    foreign key(doc_id) references employee(employee_id));
