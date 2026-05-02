Return-Path: <linux-doc+bounces-85480-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFXGAPzj9WkAQQIAu9opvQ
	(envelope-from <linux-doc+bounces-85480-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 13:46:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA894B1D6B
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 13:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 632063009155
	for <lists+linux-doc@lfdr.de>; Sat,  2 May 2026 11:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB5632143F;
	Sat,  2 May 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="i211gjQm"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C72230C366;
	Sat,  2 May 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777722356; cv=none; b=eC+q2cLmivTCgplyYJ+nkpE6gAqaEnOuV5uAoNVcpstZtXhg6VC3KimbanvHxTEKeXz/WtF5046xGX+/vLwYUTBGvLyikOPNL1KhEGGZcKe++UEKrTVQCrjGgDBGuPiZ9J2VWrg0thSnS4aBf4TbGgiq5Es+MBQXk9LEhhW1dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777722356; c=relaxed/simple;
	bh=WAxh7NIxIRfdSPNOcNeAK16za/CAfyD89M84k9A6dcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvB02thZbJMOYZbLgPvIk+hSvFNihdOp88SRvKajJdrnE1dZtomoNI+GZgbxe0fzZLNZnqvRPtoJnhm8UriFqudrJlHwD/2sUGiBtGLgLWtoIXsDLYM2/6z9g38WuJ1YK46ri/YPAxjN8dcXCil0yIC0Ocwm+VNOsXUj++g/NWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=i211gjQm; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1777722353; bh=WAxh7NIxIRfdSPNOcNeAK16za/CAfyD89M84k9A6dcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=i211gjQmX9aX1Lad+MPHhhFbJbprtSDVSEi7Ji6uSS31GsvJb3RxGhDp73zlV7N11
	 oesG3jkL5cr/Tk2vDEcMChpBaBTpKVT57mBuu8dO1tk25PIvgAEiBWZX7fhL+7TZkr
	 a63AWlQo+aMJPlSEtImfdHrs8486QMDNZYCd+qAE3vMCY0diVZTM9DExnGphonHT9Y
	 vNWRfQdnBLkIPSIal1g/qtH0EzU+VVjwNzcjm4+If0FQaeHoNbrT+/BKzAKmcgk2lB
	 ugmKowh18KyGYZc1kEHyR9ZyGsqhkwf5FU5AmWIfNFbdGNe4Fn2xY7/h3GVta7foZo
	 /dsmFjlBYkVTQ==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id B504E407BE00;
	Sat,  2 May 2026 13:45:53 +0200 (CEST)
Date: Sat, 2 May 2026 13:45:29 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Wang Zihan <3772548978@qq.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, 2023002089@link.tyut.edu.cn,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH] Documentation: loongarch: Fix typo "eXtention" ->
 "Extension"
Message-ID: <20260502134529.0cdcd4d9@tag.xn--rombobjrn-67a.se>
In-Reply-To: <tencent_ADC4AD99CFC8EFB26D25889B11D4864B9B05@qq.com>
References: <tencent_ADC4AD99CFC8EFB26D25889B11D4864B9B05@qq.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dgi1PPZDUSSxcrnozuKmCye";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Rspamd-Queue-Id: DDA894B1D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-85480-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xn--rombobjrn-67a.se:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tag.xn--rombobjrn-67a.se:mid]

--Sig_/Dgi1PPZDUSSxcrnozuKmCye
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Wang Zihan wrote:
> -- 128=E4=BD=8D=E5=90=91=E9=87=8F=E6=93=B4=E5=B1=95LSX=EF=BC=88=E5=85=A8=
=E7=A8=B1Loongson SIMD eXtention=EF=BC=89=EF=BC=8C
> -- 256=E4=BD=8D=E5=90=91=E9=87=8F=E6=93=B4=E5=B1=95LASX=EF=BC=88=E5=85=A8=
=E7=A8=B1Loongson Advanced SIMD eXtention=EF=BC=89=E3=80=82
> +- 128=E4=BD=8D=E5=90=91=E9=87=8F=E6=93=B4=E5=B1=95LSX=EF=BC=88=E5=85=A8=
=E7=A8=B1Loongson SIMD Extension=EF=BC=89=EF=BC=8C
> +- 256=E4=BD=8D=E5=90=91=E9=87=8F=E6=93=B4=E5=B1=95LASX=EF=BC=88=E5=85=A8=
=E7=A8=B1Loongson Advanced SIMD Extension=EF=BC=89=E3=80=82

That's obviously done intentionally to highlight the X. Like it or
dislike it, but it's not a mistake.

Bj=C3=B6rn Persson

--Sig_/Dgi1PPZDUSSxcrnozuKmCye
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmn149kACgkQ4Tha3NZK
5j9IDhAAjo1g9UUfWJHHi0VOS0XX7JYT3cl00sa7qT1uDSBQt3yyraXzSJndj4Je
fspQplk0PB3/gPC1IP3L0LVfa0Vqcxe0q8EHk5ZY22uB+uaKZRrNAwoYP1cf7qN5
zQaU1eWcnihvbkYceMBue0pCKRORY5oBn6TXeJTdgNiNiGiewKYwn/9xpl0Yw0gg
fS/3CEgeYmZuEEdkOoNJNokNlYrAeFleoPlo1mbLDQc3t46zdKywFbz3yCNnMt1K
zJhuugRdcG8/Ed6cE+PALPBU2EXbzhc6B96fi19DELbpbUjWkEfi0A3NNfFVjzpr
t3pjg5r+9k0IWplZf4tY5eS147IesGkugm+cSezDsNG5U/ovT6qVU4SpYqsQ6001
3WdHs0gNSuvJ6Spm+XZq4EFHzkk5Kwhn48XWwcZbMNz5/hOydROeFr4Ex2N2PccX
fWywmsqrGv/KXVV3ORaWGENxTIaPZfJAk/dmwukWltbUHr+fefzYqgqE4soOjn3y
xBfdHjZZPr+AEh2B1VBZ3o27AUOdlMAsmRlveOZ8XoxB6xmqGoY/KpFcZ1WeCZrq
CSUzUtfOQnHCfR5Ee31kpTGBd84Umu/ZCj/X6OsCFiyGMdFs85iYs77XSb8ic2mj
+Rn1zAeTD7B4wY7xTBgIMEMjszkBydMYpmS/KjmitpqNJCJ8TXg=
=M/2g
-----END PGP SIGNATURE-----

--Sig_/Dgi1PPZDUSSxcrnozuKmCye--

