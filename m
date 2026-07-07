Return-Path: <linux-doc+bounces-95327-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yB3ULPq+TGpgpAEAu9opvQ
	(envelope-from <linux-doc+bounces-95327-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:55:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C1471968D
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 10:55:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=GtK7Z5VM;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95327-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95327-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CC0F306F2DF
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 08:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13EA351C0D;
	Tue,  7 Jul 2026 08:48:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8933291F
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 08:48:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414117; cv=none; b=TjSDaNiAyUZ6G/uJR2bkzC2zRUFZ2MQV4u+S3Ymkpa+6xq03g1gp/jp7jtnkWQHz71ybllgxZ5lhDMGfMtHfGpUC6LQ08pSIVFWaldJrsUmlY4TmSpbvT1fPy4y7KU34zRLX8wGLPscOkFf6vkjqJLmfWaTFot+hDkB/JBh2hJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414117; c=relaxed/simple;
	bh=B7IpEGimiq97mBhe4ez+EoRJVMiEWH0AXP6PlEke+J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpMDFtxiwOA44awSbeo/4Ff7tb4J8MvecSmymYD0vH8qo/fEcPkoGOqCnLHBZq5ieZO+5tGELxx2VLDygpfHjJwGZXXXTQQKW2MybwLLnK+VkTMPSDHaOU0MNWYwvARhpPPlWMdRi7ZHR0xzjoBQ3yB8NfUpjjNlFfzB8bjlsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GtK7Z5VM; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-470174001a0so2078124f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783414114; x=1784018914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7IpEGimiq97mBhe4ez+EoRJVMiEWH0AXP6PlEke+J8=;
        b=GtK7Z5VMSubNMycNF1j3kex0rt2Frz/ofKdE6tAAxDmUgdHzTZYnQ64mKdvcW589qA
         8U7w5VEkgTK+rrvPPyEr5LG1ofotAGze/29hnYGcqPXXQp+LplDs/jQzL7fg/tDfWDBQ
         TVp25zS+9bVDBfJqT+2/TaCUpySPYSZpRq/GRoQaJLt3QhleB3qXtttq1KWHZXx7wF3G
         xe1wAlJX5yD/cA5Q6gfJrh1zZcRhVFnQv8mjuYgxPV5ZnRllSCRU6Zee2/ZkGjg0cAHH
         WvW7RKodXJcwHmXM5OxggVMIyDbGoCXr/e2OONuutKxXS+gYJWOB6GMpSFjxp9yU7GBb
         w79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414114; x=1784018914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7IpEGimiq97mBhe4ez+EoRJVMiEWH0AXP6PlEke+J8=;
        b=r7FTK/c3xpy94t6395Gqym4F/5g/UxdBUuhYQ+tTE+B5YrvJ9wSUUxZvgS83v4ZrwW
         36MQ16f0/zc64wC7eqPfs4PkxwItb+EdwzeG2gSiP70bSyboECFvik5siPht56ctuwdC
         i1JMhniiSuFVsZZXjpsulcltYH1ezu57C3qBwbPU0TG8ixUqdnzg8vNv4ygGqXFimfZT
         VuHPf62fJYSC6QdiD7xHK6US5IhpUDRHCvARTKpzKYs/LPVPI+IkKEHcSQok/wYbaQsz
         qD0mHnTonzG+1s+PQVRbJ1Wc5yBfn1paI01egS9vwKye7oTJjHDq2aGUey2+VQRNiPkq
         Bqag==
X-Forwarded-Encrypted: i=1; AHgh+RrMpr6J4Uj8LYzwf6AMarWqLdj9yXTxkMtZ0IknnEnLgNHCMEcS8ODhOfz6LCMty0skigGj87uKUb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcl0yZV4/QuihctOfxpNDVrfjtVbtlvG3IJR0C48o1bMPdnf4x
	R9gwiRMNTZbCSFe+82X5vNDH4aHlIWO0GK2T4uL3/0PH3ayjpZZTGcoV9T6HOArHUMY=
X-Gm-Gg: AfdE7cmbRpoorpuIqWySfW9XpjF40ddCpQcMSkY41xDlBX2uR8p/8nw1pfBVOPpuG0J
	6h4Z2eTBaBuKm/CrSKWwHtf8AKCL77iLJg1hbzwKoAGshQzfqsImu3IJ6AqCYB6LXRym/T8+CjE
	j0L15I4AJGYSwL3hesjKAHLNrX3a4R6BH7UslCRL1MKRSh9cVEPLsl2uh2/13MhvkltXdS4s1Q+
	QQEDhoQvkB38aZg/3S14yYFQ5m17taA1zNQVMFtF4hVlHBKffSA/lJDRx7Q2UaEIzZV+t6fnmDy
	1HjVrz1ukP+p1w6zy4nD8GYumZo/ENm1F4UGnpprMauMGC4vnpoZXGkcq17OsfgBYkH86wgfmpF
	4Gj8vvsQ+ure0y9wFf7LCifoc4mIN1G4fVQrCpIMd4plJqPCjritW7ylG5ag8d25N/OmzEjbA3B
	X4pGYJPIa7TwFrxzlZJPmg4UCa2Ng5ko86OFYqrZe2E2E8ILWT3WSwHMChsuANyfy1StbLFiTqJ
	2eR
X-Received: by 2002:a05:6000:25c2:b0:46a:234:d2e with SMTP id ffacd0b85a97d-47de670a006mr4350047f8f.38.1783414114474;
        Tue, 07 Jul 2026 01:48:34 -0700 (PDT)
Received: from localhost (p200300f65f47db0437b4d928ee3eb6f8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:37b4:d928:ee3e:b6f8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ad21sm31630429f8f.20.2026.07.07.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:48:33 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, 
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	liu.qingtao2@zte.com.cn, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Newman <peternewman@google.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <aky9S8A5dgIJjd7b@monoceros>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
 <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qztydshr4q4j5sd4"
Content-Disposition: inline
In-Reply-To: <20260706-dfustini-atl-sc-cbqri-dt-v4-8-e75c20201d64@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fustini@kernel.org,m:aricciardi@baylibre.com,m:alex@ghiti.fr,m:atishp@rivosinc.com,m:atish.patra@linux.dev,m:babu.moger@amd.com,m:ben.horgan@arm.com,m:bp@alien8.de,m:cp0613@linux.alibaba.com,m:conor.dooley@microchip.com,m:conor+dt@kernel.org,m:dave.hansen@linux.intel.com,m:Dave.Martin@arm.com,m:fenghuay@nvidia.com,m:gong.shuai@sanechips.com.cn,m:gsh517@gmail.com,m:guo.wenjia23@zte.com.cn,m:james.morse@arm.com,m:mindal@semihalf.com,m:krzk+dt@kernel.org,m:liu.qingtao2@zte.com.cn,m:zhiwei_liu@linux.alibaba.com,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peternewman@google.com,m:rkrcmar@ventanamicro.com,m:reinette.chatre@intel.com,m:robh@kernel.org,m:samuel.holland@sifive.com,m:bigeasy@linutronix.de,m:tony.luck@intel.com,m:vasu@rivosinc.com,m:ved@rivosinc.com,m:liwei1518@gmail.com,m:cuiyunhui@bytedance.com,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:devicetree@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-doc@vger.
 kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95327-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,ghiti.fr,rivosinc.com,linux.dev,amd.com,arm.com,alien8.de,linux.alibaba.com,microchip.com,kernel.org,linux.intel.com,nvidia.com,sanechips.com.cn,gmail.com,zte.com.cn,semihalf.com,dabbelt.com,google.com,ventanamicro.com,intel.com,sifive.com,linutronix.de,bytedance.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,monoceros:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40C1471968D


--qztydshr4q4j5sd4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 8/8] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 04:06:18PM -0700, Drew Fustini wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--qztydshr4q4j5sd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpMvV4ACgkQj4D7WH0S
/k6v2AgAl2287/4HQdpHnTug1nV07MMobHFzJ3S4RVStcbqDYYzz13jQz2rZa6De
h3bwnHtKRaWt0KGFus+38vYwJklCFYLbhQN03osh+8lbz0SZFCR2LhqYZ4NqRYpL
7YE7uJZZ0+PC0e8/9zRxAzCm3uUzdWf40hTy2rY73zLaieF5wf3ouGQ9zNNfNT/4
DQhLEXEErGBrZ+bCPvOmHXL8AOtqXFSDLgdQKssqT/pBoQMkcf9ng4DtpeDDwHzc
a6UBUrgNPUSGvwxHGh7hOFxnOUwrrFaQiks6LKJ3T4MLICtMMHBwBulmJXRQKkzz
JEHzbEDCw5lqHMYE4K+SFmz38WjUUA==
=eLlr
-----END PGP SIGNATURE-----

--qztydshr4q4j5sd4--

