Return-Path: <linux-doc+bounces-92093-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UeJUEKy/K2oiEQQAu9opvQ
	(envelope-from <linux-doc+bounces-92093-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 10:13:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA1677B25
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 10:13:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=flrv6BBr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92093-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92093-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 289E530091EC
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 08:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A55F372059;
	Fri, 12 Jun 2026 08:13:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3845135675D;
	Fri, 12 Jun 2026 08:13:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252004; cv=none; b=I3TsyNptKGImCqd50lVcrKA0Ob4wHWRDr9YETvITrsSoEO/DD7NWgydRaopHmGqaUuzGit8A53kiM+ODUDseGbg4Mc1UXaqKejreMG5r9fzpje+tvBW8VXPqmNMed85vAhCU0bTTPMlMxnHXH8RtuxSOC3vzcceQuiNhmid3954=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252004; c=relaxed/simple;
	bh=EtJZAYs6E/WZgQq7Sg+kISDy17uxy7ak03wdp/fu4Ik=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS+42z7AdA7ZKY3CgXDJfJf7RPSC7l2iNusQ/lrkjsZcPzvAUzHGsWAGfF7pUkhvdxl0nboqeK5bEifBjaQkOtQL2CX2RWHfVPcPKwXtv8qZaHAn6C1XL46Fe6sPANu3Y4f8/GgB6U8TYVK5uCD95IFzHoyV3dfqP5CxN9YiJo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=flrv6BBr; arc=none smtp.client-ip=68.232.153.233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781252003; x=1812788003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EtJZAYs6E/WZgQq7Sg+kISDy17uxy7ak03wdp/fu4Ik=;
  b=flrv6BBroa09S8MtaPcglDtTAvyNg+Hc3j2E7nPWZRDdfoZYeu+yLQtX
   Ql+u/bT/54fK4G1yJyIEfXG2mUxhxtZtf/ni5/kN0oGBOtEvM+RAWe763
   tKLBKDg7/Z7c+p1kMXKgcMFeUemyjvQZh4UJGVQwwzO4S1+oPyRSBDgs+
   dPqTQjB7xkQqYaWUEcMrvvJMDFldG9XZruprr2qmg1N1FbcGX+Y583UJA
   e2iNXrLNEGevZBYpW5gpgULPMXZg06kYKFY8+t26mrF4qsM/ZnHE7v5h1
   r4dHtBRaB1uN2l42JBi8PA7ZX5amyKhwPdJj+21NSneumJQkm++yPBlEp
   Q==;
X-CSE-ConnectionGUID: pgiZR6tuTNqjfYasAurGdA==
X-CSE-MsgGUID: DLJWxWdJR4OYwN1yOiQ8Ow==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="asc'?scan'208";a="290396387"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 01:13:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 12 Jun 2026 01:13:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 01:13:16 -0700
Date: Fri, 12 Jun 2026 09:12:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guodong Xu <docular.xu@gmail.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Zong Li
	<zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<spacemit@lists.linux.dev>, <sophgo@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Andrew
 Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/16] riscv: Add B to hwcap and hwprobe
Message-ID: <20260612-unsorted-sequester-6a4ec6b9d583@wendy>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-7-3f01a2449488@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PQqI/ma7D3SyX7fS"
Content-Disposition: inline
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-7-3f01a2449488@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92093-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[conor.dooley@microchip.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:docular.xu@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:zong.li@sifive.com,m:debug@rivosinc.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:linux-doc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:paul.walmsley@sifive.com,m:conor@kernel.org,m:devicetree@vger.kernel.org,m:spacemit@lists.linux.dev,m:sophgo@lists.linux.dev,m:linux-kselftest@vger.kernel.org,m:palmer@sifive.com,m:andrew.jones@oss.qualcomm.com,m:docularxu@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,sifive.com,rivosinc.com,brainfault.org,linux.dev,outlook.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,microchip.com:dkim,microchip.com:email,microchip.com:from_mime,vger.kernel.org:from_smtp,wendy:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08FA1677B25

--PQqI/ma7D3SyX7fS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 04:12:44PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
>=20
> Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
> are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
> RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
> mirroring the F/D/C/V pattern where each is reported via both hwcap
> and hwprobe.
>=20
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> [Add B to hwprobe]
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--PQqI/ma7D3SyX7fS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiu/bgAKCRB4tDGHoIJi
0qW0AP4zDRXj0LcaBFyBnGq6O7UoIBzoElEBlRQMmlD1lzUdDAD/WDVIu88sPWvA
kcQWsFvqgBTiL+CUQBbWI3amTlmHgQI=
=nHj3
-----END PGP SIGNATURE-----

--PQqI/ma7D3SyX7fS--

