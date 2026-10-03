export class News {

    news_id: any;
    writer: any;
    title: any;
    description: any;
    publ_date: any;
    image: any;
    category: any;

    constructor(news_id: any,writer: any,title: any,description: any,publ_date: any,image: any,category: any){
        this.news_id = news_id;
        this.writer = writer;
        this.title = title;
        this.description = description;
        this.publ_date = publ_date;
        this.image = image;
        this.category = category;
    }
}


