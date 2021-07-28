Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3243D8EA2
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jul 2021 15:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236548AbhG1NI7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Jul 2021 09:08:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:58344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236430AbhG1NIc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Jul 2021 09:08:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B45160F02;
        Wed, 28 Jul 2021 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627477710;
        bh=H1S7AlV0COt/bxaXeyQx1d8vL8M0dbUMU7ZJt6NPQao=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lhF2L+uVa1UwdQ7Cqk0pnrjHOQNx7pTKWuDDejBNYjN7A4it/H9lYpeC/cKU1T5bw
         hQM3Na89GeH11aOtWH5LwuNLnQAzrNKm1hNd9combq4MNd6d5kj5hDdM43SvCKXuKm
         mQOhkROUEBDNzZVgDZy+12+010DsTRsyj4B8C+cW8N8WMZzTKfcnsxLC5IeSxnLEkM
         Usd1c13/hPiRiWHeJ/26+IQEYEfcTRZhtc2H+p0eWQJKqapIBSJDHdGLSMPqq0dXGK
         f+ajcoWDqnl3jOR5pdzhqf7hM7P7LLGGQbhY4LgJjY4meNxxAHNKQB500JiB5bLB/j
         ByRRqXtjzReFA==
Date:   Wed, 28 Jul 2021 15:08:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Roberto Sassu <roberto.sassu@huawei.com>
Cc:     "zohar@linux.ibm.com" <zohar@linux.ibm.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC][PATCH v2 02/12] diglim: Basic definitions
Message-ID: <20210728150823.705623ad@sal.lan>
In-Reply-To: <eb3b025820574f0d901a38a4ad088018@huawei.com>
References: <20210726163700.2092768-1-roberto.sassu@huawei.com>
        <20210726163700.2092768-3-roberto.sassu@huawei.com>
        <20210728133102.339c7b8e@coco.lan>
        <eb3b025820574f0d901a38a4ad088018@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 28 Jul 2021 11:45:02 +0000
Roberto Sassu <roberto.sassu@huawei.com> escreveu:

> > From: Mauro Carvalho Chehab [mailto:mchehab+huawei@kernel.org]
> > Sent: Wednesday, July 28, 2021 1:31 PM
> > Em Mon, 26 Jul 2021 18:36:50 +0200
> > Roberto Sassu <roberto.sassu@huawei.com> escreveu:
> >   

> > > +struct compact_list_hdr {
> > > +	__u8 version;
> > > +	__u8 _reserved;
> > > +	__le16 type;
> > > +	__le16 modifiers;
> > > +	__le16 algo;
> > > +	__le32 count;
> > > +	__le32 datalen;
> > > +} __packed;
> > > +#endif /*_UAPI__LINUX_DIGLIM_H*/  
> > 
> > Besides Greg's notes, I'm wondering why to enforce a particular
> > endness here. I mean, this is uAPI. I would expect it to use the
> > CPU endianness instead, in order to avoid uneeded conversions.  
> 
> Also Greg had the same concern. I hoped the Lifecycle section clarified
> the fact that digest lists are generated by software vendors not the
> local system. Should I add something more in the documentation?

It shouldn't matter what kind of endness software vendors use on
userspace (either CPU or a fixed endiannes - either LE or BE).

I mean, I won't doubt that some package tools use LE while others
would use BE. At some point, this needs to be converted to 
CPU endiannes.

IMO, the best would be to isolate whatever RPM/DEB/... endianness 
is used on userspace from what the Kernel will use internally.

Just my 2 cents.

Regards,
Mauro
