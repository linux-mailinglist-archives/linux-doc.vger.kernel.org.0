Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3D45FFD23
	for <lists+linux-doc@lfdr.de>; Sun, 16 Oct 2022 05:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiJPDSi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 15 Oct 2022 23:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiJPDSh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Oct 2022 23:18:37 -0400
X-Greylist: delayed 517 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 15 Oct 2022 20:18:35 PDT
Received: from mail-200161.simplelogin.co (mail-200161.simplelogin.co [176.119.200.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BD53D5A9
        for <linux-doc@vger.kernel.org>; Sat, 15 Oct 2022 20:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=dkim;
        t=1665889794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZA2KViCbdQ1mYPrnsOfmnQIfT7I0QCWxt3tZgxc2NzQ=;
        b=jRSVGNjsxzf50/60R2FhRyHkDRccfsYvsogtcJ2odPfVP9lYYuTyYQYO5OwdoTJiaN/B8E
        fGQsbts26z8cW3Ycf0FNXsOXWOXJsBVOlwBijg4DzZGVphsba5+vSRXraxV11dWl24w0bd
        qnpEFgVqOWB5wPOtHHKFoZ0EW023v/M=
Date:   Sun, 16 Oct 2022 11:09:35 +0800
Subject: Re: [PATCH v1 3/5] docs/zh_CN: Add rust/general-information Chinese
 translation
In-Reply-To: <Y0rFRgnzw5Y+oNj+@bobwxc.mipc>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
From:   Rui Li <me@lirui.org>
To:     wu.xiangcheng@linux.dev
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com, corbet@lwn.net, Miguel Ojeda <ojeda@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>, wedsonaf@gmail.com,
        Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
        rust-for-linux <rust-for-linux@vger.kernel.org>, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Message-ID: <166588979418.7.9668523827405973655.69244817@lirui.org>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <2354c17a110101de2838766846a5082e6df4ff50.1665650266.git.siyanteng@loongson.cn>
 <Y0rFRgnzw5Y+oNj+@bobwxc.mipc>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 69244819
X-SimpleLogin-Want-Signing: yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 15 Oct 2022 22:35:50 +0800
"wu.xiangcheng at linux.dev" <fyqznjfscvhmhtrybuyvbyjnqkkhrser@simplelogin.co> wrote:

> > Translate .../rust/general-information.rst into Chinese.
> > 
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../zh_CN/rust/general-information.rst        | 75
> > +++++++++++++++++++ .../translations/zh_CN/rust/index.rst         |
> >  2 +- 2 files changed, 76 insertions(+), 1 deletion(-)
> >  create mode 100644
> > Documentation/translations/zh_CN/rust/general-information.rst
> > 
> > diff --git
> > a/Documentation/translations/zh_CN/rust/general-information.rst
> > b/Documentation/translations/zh_CN/rust/general-information.rst new
> > file mode 100644 index 000000000000..58a28eb6f01d --- /dev/null
> > +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> > @@ -0,0 +1,75 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/rust/general-information.rst
> > +
> > +:翻译:
> > +
> > + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> > +
> > +
> > +基本信息
> > +========
> > +
> > +本文档包含了在内核中使用Rust支持时需要了解的有用信息。
> > +
> > +
> > +代码文档
> > +--------
> > +
> > +Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
> > +
> > +生成的HTML文档包括集成搜索、链接项（如类型、函数、常量）、源代码等。它们可以在以下地址阅读
> > +（TODO：当在主线中时链接，与其他文档一起生成）：
> > +
> > +	http://kernel.org/
> > +
> > +这些文档也可以很容易地在本地生成和阅读。这相当快（与编译代码本身的顺序相同），而且不需要特
> > +殊的工具或环境。这有一个额外的好处，那就是它们将根据所使用的特定内核配置进行定制。要生成它
> > +们，请使用 ``rustdoc`` target，并使用编译时使用的相同调用，例如::
> 
> target -> 目标
> 
> > +
> > +	make LLVM=1 rustdoc
> > +
> > +要在你的网络浏览器中本地阅读该文档，请运行如::
> > +
> > +	xdg-open rust/doc/kernel/index.html
> > +
> > +要了解如何编写文档，请看coding-guidelines.rst。
> 
> 请看 coding-guidelines.rst 。
> 
> > +
> > +
> > +额外的lints
> > +-----------
> > +
> 
> Is there any good translation for "lint" ?
> 
> > +虽然 ``rustc``
> > 是一个非常有用的编译器，但一些额外的lints和分析可以通过 ``clippy``
> > +（一个Rust
> > linter）来实现。要启用它，请将CLIPPY=1传递到用于编译的同一调用中，例如::
> > +
> > +	make LLVM=1 CLIPPY=1
> > +
> > +请注意，Clippy可能会改变代码生成，因此在构建产品内核时不应该启用它。
> > +
> > +抽象和绑定
> > +----------
> > +
> > +抽象是Rust代码，用于包装来自C端的内核功能。
> 
> 抽象是用Rust代码包装来自C端的内核功能。
> 
> > +
> > +为了使用来自C端的函数和类型，需要创建绑定。绑定是Rust对那些来自C端的函数和类型的声明。
> > +
> > +例如，人们可以在Rust中写一个 ``Mutex`` 抽象，它从C端包装一个
> > ``Mutex结构体`` ，并 +通过绑定调用其函数。
> > +
> > +抽象并不能用于所有的内核内部API和概念，但随着时间的推移，我们打算扩大覆盖范围。“Leaf”
> > +模块（例如，驱动程序）不应该直接使用C语言的绑定。相反，子系统应该根据需要提供尽可能安
> > +全的抽象。
> > +
> > +
> > +有条件的编译
> > +------------
> > +
> > +Rust代码可以访问基于内核配置的条件性编译:
> > +
> > +.. code-block:: rust
> > +
> > +	#[cfg(CONFIG_X)]       // Enabled               (`y` or
> > `m`)
> > +	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
> > +	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
> > +	#[cfg(not(CONFIG_X))]  // Disabled
> > diff --git a/Documentation/translations/zh_CN/rust/index.rst
> > b/Documentation/translations/zh_CN/rust/index.rst index
> > fe884d1da353..c4d773a8a288 100644 ---
> > a/Documentation/translations/zh_CN/rust/index.rst +++
> > b/Documentation/translations/zh_CN/rust/index.rst @@ -16,10 +16,10
> > @@ Rust :maxdepth: 1
> >  
> >      quick-start
> > +    general-information
> >  
> >  TODOList:
> >  
> > -*    general-information
> >  *    coding-guidelines
> >  *    arch-support
> >  
> > -- 
> > 2.31.1
> > 
> > 
> > 
> 

We could leave "lint" untranslated in my perspective. This may lead to a better understanding for readers.

Rui

