Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951062D6DF7
	for <lists+linux-doc@lfdr.de>; Fri, 11 Dec 2020 03:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388094AbgLKCHY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 21:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388039AbgLKCG5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 21:06:57 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F23C0613D3
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 18:06:17 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id f132so8133592oib.12
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 18:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f9RSyWHl3Z1A9igwbyiPb+HKfrL5RmW/7S10//clEIc=;
        b=e2yI+Iplee0/vctTdk8XUsTgKJ7vxYwhrkV2a5JcjCHSrCc2JRRAb64vCVfsV7yo78
         B0ZNIum9QeuLW3JNwUuaZG2g3bxfLuTUkStSp4GcrnHR6b8aD2Qmu4beiT2tlp1Xk2uj
         i85VZRIc2PPfL0mUEg+9jE+n36rrkc2HX6ZuTgjxVFN0X4I11Z8HwAa/kA9GZWqcHwBk
         l77av4ppjbBvFERMzXJyIApvE62pju92vDXmohXXDF5Vqi+KkqV8HH8t8qdhWjlxmMJS
         D8KLMcTacHU/v/6HJSMsAdX8qKruqZqekPjW2AfUob9e1Imxo4+qvUVHofsCjxYLg1PQ
         9mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f9RSyWHl3Z1A9igwbyiPb+HKfrL5RmW/7S10//clEIc=;
        b=RAW6fQfArXXrASpX7S8WKA+PQe1fynMK1zHJGdLKN657MEz7Ka9+hzC10+O8asAove
         X+vtaVk9hNAer87fZpfjKpsPiZQuEMUP3/XjcHPR2znAcyP8IflyQdexI0rC/T90Fnmm
         jb2pVsJHiETOPNhH7sIRuddyJUsxCe0OQuAIs1RH253tlGsXvClrjIRSBT24bzeeTmBb
         kIU3BQF+p/AFgqXEnHuF/bJfX8N1WmhiBxhtZwls82u29Y0rxNt43dc9llXA0duvk12l
         XnMbnrhjQuoPZpC8Jf8szGZpPisgZAjd5oXF47jcVBubsYwVe+WfD5KE/51XrbRfhdax
         iz9Q==
X-Gm-Message-State: AOAM530ia6K+zyT4rUKAa3Obhi9HPpHlKw7uUIgYBrJEg+K6pyABQnsH
        IY4OeHfAOygLH8mI4NP0XcvnzrEVO9xYAUmZpJEXzA==
X-Google-Smtp-Source: ABdhPJzs0/lE6TSq5HnlKNF+j99NifDWVBECFpzx5ngO00Z+i5z0ERHOjWxD76IkEiusio5CVOYgPLUR+7AXcIsYuE0=
X-Received: by 2002:aca:5e03:: with SMTP id s3mr7651344oib.125.1607652376343;
 Thu, 10 Dec 2020 18:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20201210092853.303-1-wangzhiqiang.bj@bytedance.com>
 <X9HtwHo8s6e2UsAT@kroah.com> <CAH0XSJt3=XJ_gQb2rTvbUcbyow2k7E4jfuKGKAKdi+nwdfauVw@mail.gmail.com>
 <X9H4r3XZynGtSDw0@kroah.com> <CABoTLcSiCsASu_prfxH_sZrm-njcYzkcvrrpS1envj7QvxYtNA@mail.gmail.com>
In-Reply-To: <CABoTLcSiCsASu_prfxH_sZrm-njcYzkcvrrpS1envj7QvxYtNA@mail.gmail.com>
From:   Lei Yu <yulei.sh@bytedance.com>
Date:   Fri, 11 Dec 2020 10:06:05 +0800
Message-ID: <CAGm54UFJt2PHJThigVYLrgKqBz7rNF-vWYFJ5wykBx+GPjzihw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] misc: aspeed: Add Aspeed UART routing
 control driver.
To:     Oskar Senft <osk@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Wang <wangzhiqiang.bj@bytedance.com>,
        Lotus Xu <xuxiaohan@bytedance.com>,
        Yong Li <yong.b.li@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 8:33 PM Oskar Senft <osk@google.com> wrote:
>
> The purpose of this driver is to allow manipulation of the UART routing a=
t runtime. Setting the routing in the DTS would obviously not allow that.
>
> From what I remember, I used am existing unrelated driver as template. Ap=
ologies for using the wrong APIs - I literally just followed what I had see=
n elsewhere.
>
> Since posting this driver, we found that while it solved our initial use =
case, that use case has evolved. We're now using Aspeed's VUART where bytes=
 are routed "manually" (i.e. copied between devices) rather than in hardwar=
e. So I don't need this driver anymore.
>
> If it's still useful to anyone, please take ownership and modify it as ne=
eded to be able to submit it. I'm still happy to keep an eye on it and help=
 explain its purpose.
>

The driver is useful for our system, and it's used in intel-openbmc as well=
.
We (John and I work for the same employer) have the chance to use
Andrew Jefery's ["bmc-misc" driver][1] to configure the various
registers in dts to setup the UART routing, but that driver was not
accepted by upstream.

So we end up sending this patch here for upstream's comment.
If it's considered not a good option, we will have to keep it downstream.

[1] https://lore.kernel.org/openbmc/20180711053122.30773-1-andrew@aj.id.au/

--=20
BRs,
Lei YU
