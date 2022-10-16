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
> > +:����:
> > +
> > + ˾���� Yanteng Si <siyanteng@loongson.cn>
> > +
> > +
> > +������Ϣ
> > +========
> > +
> > +���ĵ����������ں���ʹ��Rust֧��ʱ��Ҫ�˽��������Ϣ��
> > +
> > +
> > +�����ĵ�
> > +--------
> > +
> > +Rust�ں˴���ʹ�������õ��ĵ������� ``rustdoc`` ���м�¼��
> > +
> > +���ɵ�HTML�ĵ�������������������������͡���������������Դ����ȡ����ǿ��������µ�ַ�Ķ�
> > +��TODO������������ʱ���ӣ��������ĵ�һ�����ɣ���
> > +
> > +	http://kernel.org/
> > +
> > +��Щ�ĵ�Ҳ���Ժ����׵��ڱ������ɺ��Ķ������൱�죨�������뱾���˳����ͬ�������Ҳ���Ҫ��
> > +��Ĺ��߻򻷾�������һ������ĺô����Ǿ������ǽ�������ʹ�õ��ض��ں����ý��ж��ơ�Ҫ������
> > +�ǣ���ʹ�� ``rustdoc`` target����ʹ�ñ���ʱʹ�õ���ͬ���ã�����::
> 
> target -> Ŀ��
> 
> > +
> > +	make LLVM=1 rustdoc
> > +
> > +Ҫ���������������б����Ķ����ĵ�����������::
> > +
> > +	xdg-open rust/doc/kernel/index.html
> > +
> > +Ҫ�˽���α�д�ĵ����뿴coding-guidelines.rst��
> 
> �뿴 coding-guidelines.rst ��
> 
> > +
> > +
> > +�����lints
> > +-----------
> > +
> 
> Is there any good translation for "lint" ?
> 
> > +��Ȼ ``rustc``
> > ��һ���ǳ����õı���������һЩ�����lints�ͷ�������ͨ�� ``clippy``
> > +��һ��Rust
> > linter����ʵ�֡�Ҫ���������뽫CLIPPY=1���ݵ����ڱ����ͬһ�����У�����::
> > +
> > +	make LLVM=1 CLIPPY=1
> > +
> > +��ע�⣬Clippy���ܻ�ı�������ɣ�����ڹ�����Ʒ�ں�ʱ��Ӧ����������
> > +
> > +����Ͱ�
> > +----------
> > +
> > +������Rust���룬���ڰ�װ����C�˵��ں˹��ܡ�
> 
> ��������Rust�����װ����C�˵��ں˹��ܡ�
> 
> > +
> > +Ϊ��ʹ������C�˵ĺ��������ͣ���Ҫ�����󶨡�����Rust����Щ����C�˵ĺ��������͵�������
> > +
> > +���磬���ǿ�����Rust��дһ�� ``Mutex`` ��������C�˰�װһ��
> > ``Mutex�ṹ��`` ���� +ͨ���󶨵����亯����
> > +
> > +���󲢲����������е��ں��ڲ�API�͸��������ʱ������ƣ����Ǵ������󸲸Ƿ�Χ����Leaf��
> > +ģ�飨���磬�������򣩲�Ӧ��ֱ��ʹ��C���Եİ󶨡��෴����ϵͳӦ�ø�����Ҫ�ṩ�����ܰ�
> > +ȫ�ĳ���
> > +
> > +
> > +�������ı���
> > +------------
> > +
> > +Rust������Է��ʻ����ں����õ������Ա���:
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

