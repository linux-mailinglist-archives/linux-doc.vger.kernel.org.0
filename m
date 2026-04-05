Return-Path: <linux-doc+bounces-82478-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD37CKXs0WnfRAcAu9opvQ
	(envelope-from <linux-doc+bounces-82478-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Apr 2026 07:01:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841039D54B
	for <lists+linux-doc@lfdr.de>; Sun, 05 Apr 2026 07:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16F83009CF5
	for <lists+linux-doc@lfdr.de>; Sun,  5 Apr 2026 05:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBBD2F39AB;
	Sun,  5 Apr 2026 05:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMsuILmJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506030C617
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775365281; cv=none; b=VU067ZfgIGo/Cct0bssn/j5M9iIVvimplkXFscIoZqk7U+urNNVXYO9htkFUvgdYuTFfSFUeVOpm7nKh7WOTk82eAPpdHQrU2gMIQkd6t4+Q1RLy+Npk9dp9CuoaGH+pU3qz5LVVrb7JLeSH31KntcPq/GXLg7NRyI8A3KhOt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775365281; c=relaxed/simple;
	bh=wp3LW92rCkdLSGRcSCaYDGxIBE4cMUc8OWIEgIgNMKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxEkwYsOU0gOq7g3Ck61V/iRTvvXv3mfH6ZyNT9EnJ1xJtye74BekpNMeRaG4BdXiRHmA5QomQymCwcd2ZjvCmUFI2U2QbvaRZILW4pHM9RhezxxV9CwARLps8/32T6S5MwYV/QOHs/SthX6GLnSKoKLsWRl1u6op6cFJIhg980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMsuILmJ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82a67ce6969so2195443b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 04 Apr 2026 22:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775365279; x=1775970079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1L2CbGMOClV2ceb1kgpDK6wit9SVoB8t7Mg6qWl+MQ=;
        b=FMsuILmJSgVz5Wmc81dyz+Z0IZE/eGN9ztBYlmCBHe3z4wrZOfLeXMv+be/4vpmOww
         wK3azcI0WEY0REdX2QvhqMvE17C1f8WEOVuqSRBtKJxNf1VeQZ3QIP6Zl0yuoIkFb+Ss
         kcqoDQtRvhmyf4OZdkL0CmBAp7ydluk2sV8+miLH54Rq3/+rk4XF9EhDQiBJJ1Fjp7Kr
         1yxlps7rUhdTEp2SlChVZpFV6BcwQ/JGo8sZVa9zkjcwQOMqU4dXd5ciwxl31Yos3nN0
         Ze6o0Mhw47OnsAfAGNC1bjw1S/ShugX+cpm+ThrT5J35Tu9cQbmMkJHD6Xf1fIEqmdRi
         OfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775365279; x=1775970079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1L2CbGMOClV2ceb1kgpDK6wit9SVoB8t7Mg6qWl+MQ=;
        b=iA+bw6VQ+ixMYkMyTMMzMTynhsGS0aWWTz0O3a7B4ZJUMbFTTG5AUsGSLpXDqVXkUr
         ByofSgWwBnm4zCgYWq3OYNunF592C3jvpg1I+4lIw/h9YpXNIOIIFIdTt8uNOvCSRICF
         rTL7DyHWD0ScmOcmvOy8PYSiijZ1jfsu9Up2wARXaK22DJEJA/JagavqqAHhR93e6est
         IDatRRC1c7lItS7WiKpSyE3UGH9EdnE1UPdiy+a9PnA4JbxwFt7e9rxLfawBAkzVOEts
         P+hnWdyrzxSdT7ndh4wntXGOtCoEN3c0yuti49LMgv8u60o7URQv4jFegot0GgA8GxSI
         65Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUtMoDNeM2jsiiwH3Wy0sF/JNSbvVdPkcMJVPfACZeLFw5gpnuVz1BINbu0Vd6sLUt5l7FflWE1Dzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweDqihZnJt9Eh4OODBM3f12G2MrCSs9uKeNvbIwHbVvg6MA4H+
	iz6aHNsyINZEHYfGACic6FYFOkjJVpaSy9qCg9B6K0MugT8B6OUltjOm
X-Gm-Gg: AeBDieub7ENUJzZkRIouw18ECdQ6FtS+yr79H2TzmJn+nHoYhWigqy64iQGWpZmpDm7
	ITKDnW2+8aVvXgog+ePgkXmKExbvJUq5I44PFIvm4AoRRTuONSka0ELYgm/60rt0bKUBWKsnoFq
	5091+kc7YJ7KWWR/zZqpZD9n1+8QF6h6WNlXhEeu6XhE02EWg9SDNzuLEVUHF5BSryNf6865gDl
	ilTOTrTANVpHGSpIiemjxPCcUKSvNuGVE7iM1RVbFoxAC6smDjQuBYV5YAz4PXjwiXXDfywoarx
	Z0aFG7wET5wKl/scUXASfZBygnbGq1Cn27Uxz1cEz+/bvv4iXiJ9NJRw4258iA0bxWGvrAttVoD
	oH6kkf/qXSty0rvuYZg5rzsBst1yn0znfSgGIC/Sk0vXvMbMXtP8zB4s1Uuvs0J+Hbvb9DYFwBB
	8j3loR3x55q8yds9wCGAw=
X-Received: by 2002:a05:6a00:4504:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82d0da504c5mr7758144b3a.5.1775365278330;
        Sat, 04 Apr 2026 22:01:18 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3dcb3sm9949630b3a.16.2026.04.04.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 22:01:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 35AEA440197E; Sun, 05 Apr 2026 12:01:13 +0700 (WIB)
Date: Sun, 5 Apr 2026 12:01:12 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Manuel Cortez <mdjesuscv@gmail.com>, linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: Re: [PATCH] docs: fix typos and duplicated words across documentation
Message-ID: <adHsmPH7sehjq0AK@archie.me>
References: <20260405030359.7392-1-mdjesuscv@gmail.com>
 <8e489ff9-e9f8-4924-ad92-a1dbd6d33121@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2jjihRErN0ECenME"
Content-Disposition: inline
In-Reply-To: <8e489ff9-e9f8-4924-ad92-a1dbd6d33121@infradead.org>
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82478-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[infradead.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bagasdotme@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,archie.me:mid]
X-Rspamd-Queue-Id: 7841039D54B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2jjihRErN0ECenME
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04, 2026 at 08:16:05PM -0700, Randy Dunlap wrote:
> Hi,
>=20
> This last one is a little awkward as is but dropping one "in" doesn't hel=
p it --
> it harms it (i.e., it's correct as is but could possibly be improved.)
>=20
> > diff --git a/Documentation/networking/switchdev.rst b/Documentation/net=
working/switchdev.rst
> > index 2966b7122f05..948bce44ca9b 100644
> > --- a/Documentation/networking/switchdev.rst
> > +++ b/Documentation/networking/switchdev.rst
> > @@ -162,7 +162,7 @@ The switchdev driver can know a particular port's p=
osition in the topology by
> >  monitoring NETDEV_CHANGEUPPER notifications.  For example, a port move=
d into a
> >  bond will see its upper master change.  If that bond is moved into a b=
ridge,
> >  the bond's upper master will change.  And so on.  The driver will trac=
k such
> > -movements to know what position a port is in in the overall topology by
> > +movements to know what position a port is in the overall topology by

I think it can be reworded as "The driver will track movements to locate
the port's position in the overall topology ...".

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--2jjihRErN0ECenME
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCadHskAAKCRD2uYlJVVFO
o2wqAP9CZOsV2AOk0sWz5Wgrm25cX7eMdXO3cUgozTUnHQXYVAD/aRbvjsMMcg+y
xIKN/Kc9nkzOJEfVDbd9Z23rUMg+2Aw=
=A+Mc
-----END PGP SIGNATURE-----

--2jjihRErN0ECenME--

