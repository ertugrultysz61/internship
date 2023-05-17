import { LightningElement ,track} from 'lwc';

export default class A02AccountCreate2EdView extends LightningElement {
    @track recordId;
    createAccount(event)
    {
        this.recordId=event.detail.id;
    }
}