Return-Path: <linux-doc+bounces-11742-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D2E87533F
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 16:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86729284668
	for <lists+linux-doc@lfdr.de>; Thu,  7 Mar 2024 15:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC4812F36E;
	Thu,  7 Mar 2024 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="C7IrvgcW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1412E1FE
	for <linux-doc@vger.kernel.org>; Thu,  7 Mar 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709825712; cv=none; b=Ij2le6diMVb0YLohIIPzGERjmy8kTwxWtXCELGk8BLe7Gm65EIWJeRUgFxaCCnqIQcGPNIfIacyCNPfJJxEWLjHaet4SG9mruDASM171o6c38o4NPRDSo42jgh7n1IRMO/zSEFJjfzQUKtB84UM/9jxFZKXg8QhHxkPcoW37mos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709825712; c=relaxed/simple;
	bh=zQBkiWXTggIKvHEMWEiGOum5TT7ceiwVi4duUGHOdgY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=J5TzLRbrdPno4U9ZwMv7mmo+NhQyLh391I3C+f3ZniOFU/8TkhiFgfsyBDeL2fyy+V+LcH2tOMszQbfCPBceAG7a/523iO6Aj4OMfplPGj5Phjusc9lES7096fzidOKfP13KbvRIMGwRr/Zc9BiQhGSQqDGs+X5PbqkrAyeuX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=C7IrvgcW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a293f2280c7so180786666b.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2024 07:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709825707; x=1710430507; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQBkiWXTggIKvHEMWEiGOum5TT7ceiwVi4duUGHOdgY=;
        b=C7IrvgcW9Fq549kj0yAYS+DQZPX5ld1mrhJKmAK3P4C/2aTbjK/Wl7nHzsGZkKmX91
         GLWtaR8iD6jI9oDNqZ5xfQmSjLjhPTwcLrCz2Ya3JX4X76I0Tto+MU0goAmU0YRsWmoH
         JfjWxvJ98TeOxvaj2e+MSVCL43mCMJUrCUueVbdLB2eeBtO9pjH6hsbeqfeesBYk0SK2
         8Cx/xxo6v+MLtfrvsteShmNd9u6Gc7NVeLv/gz+4ozabc1QilcFPXP18rvRR6llJ+uRj
         WFdZ8YWFweDFgDCZyc5UrCcmulc+ZtJV2UUYakh2Vuyjc+/j1F+JQ88YNzgKaPk3QUMN
         K6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825707; x=1710430507;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQBkiWXTggIKvHEMWEiGOum5TT7ceiwVi4duUGHOdgY=;
        b=k3rk/szyeOqYm9hNEPkfUtMyzlW8VUjr7K5hiiLthuyApK3JyiF8uGhV3V3dqYd/S8
         okCGXJMC6Mjwy9J38GHtU+c8pPGBHvQHf7UkKPiBZdiNdaJqI75nxNQy8yp/aAwCQj4S
         mhkmD3gNWJJ+QGYVluBI86nVBi2R3D/5JDrUIipd50EzBBg79XqlZjToyfyp6ZEX64bQ
         l2gSGKdghuer3CRuutam/RLaD57oRndxQn01HO54n7tsitRpHyM+89YBcnZfZY7tGYgR
         ye7hRyu0fHAJQq66I7tjnHaEsbqwsc8msy3EKOZpNi1Ubb0WIlK9TVlSfkKcADjWD71e
         Qzmg==
X-Forwarded-Encrypted: i=1; AJvYcCVEfnDMmQIhFDQ3ROM6sAeKhdbR1nIw1qyRQjfe5FYfYW1sNP3tL2V9I1sJVZv7taRw34hCFFYWuFGhOQyiZugjogYoeETuxV/B
X-Gm-Message-State: AOJu0YyETbesn6V+YhavVzQcdaZKGoQjR4kYHvBvzzTXhWcJxRkWn9Xt
	zmI/AQEiapopJ7+lvK96Kx+TZQ2vT2sdLiTv3ZoMkuDPXGHKty6G5GHn6KKDN+c=
X-Google-Smtp-Source: AGHT+IFZFPN298xxejGvRyvzbp276Z/iMmAVyPkxVHpe9zUTmo8gWkPUve5gZl3bDKcFPppBDzmd1g==
X-Received: by 2002:a17:906:6a89:b0:a45:902b:3cb0 with SMTP id p9-20020a1709066a8900b00a45902b3cb0mr6729129ejr.58.1709825706741;
        Thu, 07 Mar 2024 07:35:06 -0800 (PST)
Received: from smtpclient.apple ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id lz19-20020a170906fb1300b00a45b7f9e822sm1973422ejb.118.2024.03.07.07.35.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:35:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v5 4/6] MAINTAINERS: add entry for DCP-based trusted keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CZLBYPUU992Q.2PRCZBFNZYWY6@suppilovahvero>
Date: Thu, 7 Mar 2024 16:34:53 +0100
Cc: Mimi Zohar <zohar@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Shawn Guo <shawnguo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 sigma star Kernel Team <upstream+dcp@sigma-star.at>,
 David Howells <dhowells@redhat.com>,
 Li Yang <leoyang.li@nxp.com>,
 Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Tejun Heo <tj@kernel.org>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E9B3F32-B162-4C84-81AD-5713EB53A85D@sigma-star.at>
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-5-david@sigma-star.at>
 <CZLBYPUU992Q.2PRCZBFNZYWY6@suppilovahvero>
To: Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)

Jarkko,

> On 04.03.2024, at 23:48, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
>> This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
>> found in smaller i.MX SoCs.
>>=20
>> Signed-off-by: David Gstir <david@sigma-star.at>
>> ---
>> MAINTAINERS | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 90f13281d297..988d01226131 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11647,6 +11647,15 @@ S: Maintained
>> F: include/keys/trusted_caam.h
>> F: security/keys/trusted-keys/trusted_caam.c
>>=20
>> +KEYS-TRUSTED-DCP
>> +M: David Gstir <david@sigma-star.at>
>> +R: sigma star Kernel Team <upstream+dcp@sigma-star.at>
>> +L: linux-integrity@vger.kernel.org
>> +L: keyrings@vger.kernel.org
>> +S: Supported
>> +F: include/keys/trusted_dcp.h
>> +F: security/keys/trusted-keys/trusted_dcp.c
>> +
>> KEYS-TRUSTED-TEE
>> M: Sumit Garg <sumit.garg@linaro.org>
>> L: linux-integrity@vger.kernel.org
>=20
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
>=20
> I can for sure put this. The code quality is *not* bad :-) However, =
your
> backing story really needs rework. It is otherwise impossible to
> understand the code changes later on because amount of information is
> vast, and you tend to forget details of stuff that you are not =
actively
> working on. That is why we care so deeply about them.

got it! :) I=E2=80=99ve tried to rework the commit messages as good as =
possible
for v6 and will send that series momentarily.

Thanks!
- David=

