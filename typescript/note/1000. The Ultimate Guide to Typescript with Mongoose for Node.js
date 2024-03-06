The Ultimate Guide to Typescript with Mongoose for Node.js

SOURCES:
https://mongoosejs.com/docs/typescript.html
https://www.youtube.com/watch?v=TbT7eO1fxuI



I. Add types to mongoose.Model

01. Create (and export) an interface which represent mongoose.Model creation input
 > this includes ALL the fields that will be present in the Document itself

EX:
export interface AccountInput {
  fullname: string;
  username: string;
  email: string;
  password: string;
  type: string;
  profile: Buffer;
  tokens: { token: string }[];
}

// inside an express Router
const newAccount: AccountInput = req.body
const account = new Account(newAccount);



02. Create (and export) an interface which represent Document of the mongoose Model creation input
	> this should extend to the interface that represent the model input AND mongoose.Document
	> here, we will add the following
		1. virtual properties that we added with Schema.virtuals
		2. static and instance methods we added with Schema.statics or Schema.methods
		3. properties added by mongoose when using some custom config like "createdAt" and "updatedAt" when using timestamps
	> NOTE: in Mongoose Documentation, its NOT recommended to extend to mongoose.Document


