Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC0A580040
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jul 2022 15:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiGYN5L (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jul 2022 09:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiGYN5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 09:57:10 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256A212D38
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 06:57:09 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so8702844otb.5
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+l85BsyJSU0UbHlmYMEOxONRkWum9Iis0lj7YjgVouo=;
        b=dWdcUyQoIWk8uY6m8Acu/6HDsqLWDHzisKnne/RysGVugfZ5HKopOqqUvUSB54/4Rt
         j/gBUlP2+2c7V9+Dko1QRuiFheGBOpKFcbrV46N4/z+JT8TxMwjN0gR5u9K3qKD9R7l6
         ObkJQXyJa8I7owcWJxg7fumn3XAkwAHq67YL7IXKmIS3xettfQ3Et2ccEaC7rq6kBiKL
         PQ8qWETGGw4h+UG/8upVqTuDqcF99cyOwepu1Zhl0edMRik6FCZBiqDQjq62liQbU+S+
         /E72R4reieefw2bx13pxMm2yGNXpuW79nTNtf2gBFiYeHageOerRolZ06Y2/B2gO57j/
         ro7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+l85BsyJSU0UbHlmYMEOxONRkWum9Iis0lj7YjgVouo=;
        b=hvNnTvlNiAMVqfa1mZ87q70FY3ek28oYYWQYawYBhx2GK5NNNoRU+YQoZNlMSItxd/
         to/SmQdhXlM2MvkUu/4W+IoRlu85fEi8l02qHYzX4xvByRlulBlRGm9S8G7x0u7Ceb13
         prbzN93/0r+Kwwr8kqVgryOUeFd4MNO32d4l9/9yxho8PSAtd5uaEKUPGioybJBxqh6R
         u17GsDY2qMNANvBNlf/jVbdZ+7oY2lN2MSEE8uHQOGa1Cp6P08gL5MtftxQMBMFrYXVl
         C6tNTwMG5Ja03XA+f2UmrespooE2mGddNCcJ9yvY1YjaS0uYVtMKDfGdB4dpvWjWh6bZ
         IXgw==
X-Gm-Message-State: AJIora9yuhWJuHB0L0D7OBBheg/qkHRER9sGtOYwMCaLQH4zffjA/f27
        zxzZQMeSTqkXCQpeaXSaKEb5iw==
X-Google-Smtp-Source: AGRyM1viWeGZygpCAGA/0LqaHJ3iwJEX7OK5ms8z7lEOosaUtO+XSEMo/iWU3So71mv+MCTq135fvw==
X-Received: by 2002:a05:6830:43aa:b0:61c:b46d:c88a with SMTP id s42-20020a05683043aa00b0061cb46dc88amr4981097otv.19.1658757428382;
        Mon, 25 Jul 2022 06:57:08 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id d24-20020a05680805d800b0032f63c4638esm4935090oij.2.2022.07.25.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 06:57:07 -0700 (PDT)
Date:   Mon, 25 Jul 2022 09:57:04 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Joe Perches <joe@perches.com>
Cc:     Baoquan He <bhe@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Slark Xiao <slark_xiao@163.com>, kafai <kafai@fb.com>,
        vgoyal <vgoyal@redhat.com>, dyoung <dyoung@redhat.com>,
        ast <ast@kernel.org>, daniel <daniel@iogearbox.net>,
        andrii <andrii@kernel.org>, "martin.lau" <martin.lau@linux.dev>,
        song <song@kernel.org>, yhs <yhs@fb.com>,
        "john.fastabend" <john.fastabend@gmail.com>,
        kpsingh <kpsingh@kernel.org>, sdf <sdf@google.com>,
        haoluo <haoluo@google.com>, jolsa <jolsa@kernel.org>,
        dhowells <dhowells@redhat.com>, peterz <peterz@infradead.org>,
        mingo <mingo@redhat.com>, will <will@kernel.org>,
        longman <longman@redhat.com>,
        "boqun.feng" <boqun.feng@gmail.com>, tglx <tglx@linutronix.de>,
        bigeasy <bigeasy@linutronix.de>,
        kexec <kexec@lists.infradead.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>,
        linux-cachefs <linux-cachefs@redhat.com>
Subject: Re: [PATCH v2] docs: Fix typo in comment
Message-ID: <Yt6hMD+HIaERgrqg@fedora>
References: <20220721015605.20651-1-slark_xiao@163.com>
 <20220721154110.fqp7n6f7ij22vayp@kafai-mbp.dhcp.thefacebook.com>
 <21cac0ea.18f.182218041f7.Coremail.slark_xiao@163.com>
 <874jzamhxe.fsf@meer.lwn.net>
 <6ca59494-cc64-d85c-98e8-e9bef2a04c15@infradead.org>
 <YtnlAg6Qhf7fwXXW@MiWiFi-R3L-srv>
 <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DTlmFVa4wvwu5Zvn"
Content-Disposition: inline
In-Reply-To: <5bd85a7241e6ccac7fe5647cb9cf7ef22b228943.camel@perches.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--DTlmFVa4wvwu5Zvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 06:52:15AM -0700, Joe Perches wrote:
> On Fri, 2022-07-22 at 07:45 +0800, Baoquan He wrote:
> > On 07/21/22 at 11:40am, Randy Dunlap wrote:
> > > On 7/21/22 11:36, Jonathan Corbet wrote:
> > > > "Slark Xiao" <slark_xiao@163.com> writes:
> > > > > May I know the maintainer of one subsystem could merge the changes
> > > > > contains lots of subsystem?  I also know this could be filtered by
> > > > > grep and sed command, but that patch would have dozens of maintai=
ners
> > > > > and reviewers.
> > > >=20
> > > > Certainly I don't think I can merge a patch touching 166 files acro=
ss
> > > > the tree.  This will need to be broken down by subsystem, and you m=
ay
> > > > well find that there are some maintainers who don't want to deal wi=
th
> > > > this type of minor fix.
> > >=20
> > > We have also seen cases where "the the" should be replaced by "then t=
he"
> > > or some other pair of words, so some of these changes could fall into
> > > that category.
> >=20
> > It's possible. I searched in Documentation and went through each place,
> > seems no typo of "then the". Below patch should clean up all the 'the t=
he'
> > typo under Documentation.
> []
> > The fix is done with below command:
> > sed -i "s/the the /the /g" `git grep -l "the the " Documentation`
>=20
> This command misses entries at EOL:
>=20
> Documentation/trace/histogram.rst:  Here's an example where we use a comp=
ound key composed of the the
>=20
> Perhaps a better conversion would be 's/\bthe the\b/the/g'

It would be good to check for instances that cross newlines as well;
i.e. "the" at the end of a line followed by "the" at the start of the
next line. However, this would require some thought to properly account
for comment blocks ("*") and other similar prefixes that should be
ignored.

William Breathitt Gray

--DTlmFVa4wvwu5Zvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCYt6hMAAKCRC1SFbKvhIj
K7XjAP9mCPlMDtWSBhCoUhLhlZfaG0XycbJFaNDw81dAkUz2RQD+Kobc2FhQZM+x
KR+ZpOFEIOreTL3gE48zETF6lxcxUAI=
=FuCv
-----END PGP SIGNATURE-----

--DTlmFVa4wvwu5Zvn--
