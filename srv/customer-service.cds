using {com.george as george} from '../db/schema';

service CustomerService {

    entity CustomerSrv as projection on george.Customer;

}
