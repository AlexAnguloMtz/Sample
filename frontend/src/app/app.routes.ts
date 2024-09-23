import { Routes } from '@angular/router';
import { IndexComponent } from './index/index.component';
import { MypageComponent } from './mypage/mypage.component';

export const routes: Routes = [
    {
        path: '',
        component: IndexComponent
    },
    {
        path: 'mypage',
        component: MypageComponent
    }
];
