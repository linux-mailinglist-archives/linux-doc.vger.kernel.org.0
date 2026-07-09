Return-Path: <linux-doc+bounces-95963-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XLSQMsKTT2oYkAIAu9opvQ
	(envelope-from <linux-doc+bounces-95963-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 14:27:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65938730F7B
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 14:27:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ejE2Et99;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95963-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95963-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393B3305CA06
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 12:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE8841F7E9;
	Thu,  9 Jul 2026 12:21:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677643B14D3;
	Thu,  9 Jul 2026 12:21:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599711; cv=none; b=kuzfY4AdzPm88SGGG0JiTQEEfWlnbeVe5KGazKBvA6tRMSR4dtDLXDfSZW0m08c+WHQiCCewGK5FfFAc5CbU34Br0HTMqrPBYGy8mwgqPFZGc01JOtL6AuohuuKmkMbyQsnoGu8xsCiJzVnvifiJDscmYIEXxmrdAMmkZh7CNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599711; c=relaxed/simple;
	bh=je+/HG0EMtJs/loHSe9xZu5retxVO446cgavJsDZxa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uv9D2UcvA+rw4BpX22rNKRQsT3Qy3zLpQk8nCWFcUWbAJOlYz5WPio0XVd5lVMjswJyTVilwkoV8MuFBH0+KtkJKQU8koQk944ihRS7ZtXsChAS9sySinm4wTQ48Lt3n8h/Aegecgwv5fOQjNDp8fbrlLCbEybUldt2QMRDVHrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejE2Et99; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197831F000E9;
	Thu,  9 Jul 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599710;
	bh=LuOciaS8DK8jmb2CFQM4/jZaaLCATTx50eQ2Thwjxio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ejE2Et99WozJ1ypz+xTfglTg5W4D821r3YBkSWZ69VfT/DXUVQDgsyOw2BKsE5Rus
	 n5UQr2tQffCuQ+eTIMbnAhij7IZKyiJDuQ3EjdGG1tJVzTdwUqLrELSFHkS8pQqxsA
	 hlEspvq+80/eU+Gj45dsw0kymVVmclO6yyDyVAdylITZ6ebavOl8agRveBg1in94XG
	 Us/hNWSBeZUmgejcm52jNyPqjdI2sacuRoPucQqiAAeFH820A8aiLPNxMeIvRI0m57
	 TumZ6eFD9Ldh/KW5/ZRTF6fxvikmcBe9pvzdWBw7P4MW1GRSGQcmLSCYYjKPEHwWym
	 qupaWM2bLQdzQ==
Date: Thu, 9 Jul 2026 13:21:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
Message-ID: <ac8c0aa6-d84d-4fd4-9059-ea79adc337a1@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvkuTVR/BvRRX0hU"
Content-Disposition: inline
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
X-Cookie: MS-DOS must die!
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95963-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:joey.gouly@arm.com,m:catalin.marinas@arm.com,m:suzuki.poulose@arm.com,m:will@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:oupton@kernel.org,m:Dave.Martin@arm.com,m:tabba@google.com,m:mark.rutland@arm.com,m:ben.horgan@arm.com,m:jpb@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:peter.maydell@linaro.org,m:eric.auger@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_TWELVE(0.00)[22];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65938730F7B


--lvkuTVR/BvRRX0hU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 01:51:37AM +0100, Mark Brown wrote:
> [ Note: I've spoken with both Mark Rutland and James Morse both of whom
>   might potentially have some overlapping changes, they've both agreed
>   that they'll deal with any rebasing if it's a question of this getting
>   in or something else. ]

Main testing for this was, in addition to a lot of not particularly
relevant coverage, running the KVM and arm64 selftests and KVM unit
tests.  I also ran the arm64 selftests (particularly fp-stress) in
guests while running fp-stress in continuous mode on the host.  Testing
was done for each of nVHE, VHE, protected mode and nested mode.

--lvkuTVR/BvRRX0hU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPklYACgkQJNaLcl1U
h9B0qAf+LBdXTQ7AYWPPO2VCenkHI7Mk3Ar2J3NEDvdagbuxAigD9tRaRejVQbv6
X+hE5pP2Ij0vPRnhodiUla8xiKplqUKX9qF8UKOi3K1USJMLnOC4FKyukI4seelo
/OMB3xjuTCcOhkffh0zUSv+6ssNVUQa9F0eGoXaDCBB0Z+Y5ut+96O3TB6o9CY2P
PYeZeycw0bLZvYzuOYXwRej52aiR/J4asZV5i8OOWTTEMEJIXB2PaVWTBnhMiEDR
VEGyfz/uIdg1RJv5lcChLnlP38Ai0leGL9Gh+bSo672GA8KEUdycqNrTpQuCV2j8
MSqXDTT5NYsRGwpA29E9JKTBqQ+46w==
=Cpl8
-----END PGP SIGNATURE-----

--lvkuTVR/BvRRX0hU--

