Return-Path: <linux-doc+bounces-95955-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bS3iBjGLT2opjQIAu9opvQ
	(envelope-from <linux-doc+bounces-95955-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 13:51:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEBE7309B5
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 13:51:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=INLRqR+i;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95955-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95955-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B11BF3015D6E
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 11:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F074B411692;
	Thu,  9 Jul 2026 11:50:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602153FCB22
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 11:50:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597816; cv=none; b=o8LEN51Iyv0WGvBBIuC49E+L6H01DOQlvNvO2NsSg8i0lDIwvMxONhMiLcW+oQUOM/8L8Q9OPeVOaty8+1RfUe+ewUhGAjRU3NMMjRcVvPF1VXMpPHFzcYlgY27pmxRYVH/EYn1njXW1rnMY9E8OhxSyfHHEIyFCEx5sAxtfMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597816; c=relaxed/simple;
	bh=ZWYDTPt2INsfrfjekJ9+Fr6OaUFIO4TQs4dluGhiECQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7nN68kd7M/+nJVreJcybowM8zEHHoVyENSokEj4CMr6wGtxXIthcpM9FN8/5GawnaF53XsBrcznZTBrFXE9U3CYB8OOiZHgr2Wb9bDI6wKP1eDq59Y9aOLXGNWBhk05rXcbuwvUYg4xMn0eh/f6zAF+AS8mwRWImsxYDrr5P0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=INLRqR+i; arc=none smtp.client-ip=95.215.58.170
X-Forwarded-Encrypted: i=1; AHgh+RrLcnL5ipFMk54UM5LLjly3HIhAfRqNmLWPJS2rqlsxHWhuDQEI9CGBK6MWm0DE99NFXWgymJ6c09o=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783597812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L3SuTrK7ua1jSt5ecvosiLTOXicZe+1p9rD4HzyC/xI=;
	b=INLRqR+ieSjA/N84vwt70/AkodsDk59oUdDJXLo/ukPq3Nsz/FSJAmlxUbkz+PlD2GyMvN
	GXrTUJbU94wBXw077Tn2cgFBscdib9y+NqbypA045nGWKdHbT0rGDkyVhSVYJHreFYg/nX
	4yrtKVAQ2GYItIOOV7J5oxe7+rVZ0oY=
X-Gm-Message-State: AOJu0YxRkf/odXBikV/0okmHsznxdx55r8ryuxZzAbruqtp3uJ1GIEuG
	HmZZPQ37XdGo4YWaqr1xXT9t+LwwdIEaMESsyZ69jRPrLQoGqFQmNhdldZGi1PRc69kkq1Xmn9b
	QskxzTv5Cwcuzih8lHRTr+Sy+x6BgPJgEmPAN11f3
X-Received: by 2002:ac8:7f0d:0:b0:51c:6b7:d3de with SMTP id
 d75a77b69052e-51c9c573e75mr5591691cf.5.1783597796410; Thu, 09 Jul 2026
 04:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com> <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
In-Reply-To: <4b2fb0ef-4d3e-4a1f-8d33-177bb4af2005@sirena.org.uk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 9 Jul 2026 12:49:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyhRFMa+diHpWyKcCuB8DrTH4p1bvraiaQnO0Fru74cHw@mail.gmail.com>
X-Gm-Features: AUfX_myGvG9GzTq40K-onGYQvIqSeZZ7bcchUs-KHtoNqS1WCKCcF98we18uqCM
Message-ID: <CA+EHjTyhRFMa+diHpWyKcCuB8DrTH4p1bvraiaQnO0Fru74cHw@mail.gmail.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:konstantin@linuxfoundation.org,m:maz@kernel.org,m:joey.gouly@arm.com,m:catalin.marinas@arm.com,m:suzuki.poulose@arm.com,m:will@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:oupton@kernel.org,m:Dave.Martin@arm.com,m:mark.rutland@arm.com,m:ben.horgan@arm.com,m:jpb@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:peter.maydell@linaro.org,m:eric.auger@redhat.com,m:roman.gushchin@linux.dev,m:tools@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[fuad.tabba@linux.dev,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-95955-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuad.tabba@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:dkim,linux-foundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BEBE7309B5

On Thu, 9 Jul 2026 at 12:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 09, 2026 at 11:26:41AM +0100, Fuad Tabba wrote:
> > > base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
>
> > I think this SHA is local to your tree. I can't locate it, and neither
> > could Sashiko [1, 2]. For a series this big and complex, it would be
> > good to get Sashiko to review it. Could you please fix that?
>
> That is the v7.2-rc2 tag, copying in Konstantin since this probably
> wants fixing in b4 and Roman for sashiko since this might bite others.
> I told b4 the code was based on v7.2-rc2 (which it is) by specifiying it
> as "v7.2-rc2" in --edit-deps and it's translated that into the git
> object hash for the tag and dropped that in there rather than the hash
> of the commit that was signed.

I figured out what the issue is in Sashiko and submitted a fix:
https://github.com/sashiko-dev/sashiko/pull/317

It wasn't advancing the local HEAD after fetching.

Cheers,
/fuad

>
> Probably if b4 is going to resolve deps into hashes it should make sure
> to resolve them into a commit object in case users aren't pulling tags
> (which I'm guessing is what's affected both Sashiko and you here).
> Either that or just keep the text (which would make it more obvious
> what's happened but doesn't actually fix anything if it's automation
> that's impacted).
>
> Unless someone objects I'll resend with the dependency specified as the
> commit object for Sashiko's benefit :/
>
> FWIW:
>
> $ git show 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
> tag v7.2-rc2
> Tagger: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 5 14:44:06 2026 -1000
>
> Linux 7.2-rc2
> -----BEGIN PGP SIGNATURE-----
>
> iQFSBAABCgA8FiEEq68RxlopcLEwq+PEeb4+QwBBGIYFAmpK+lYeHHRvcnZhbGRz
> QGxpbnV4LWZvdW5kYXRpb24ub3JnAAoJEHm+PkMAQRiGsv8H/Rn7Hr3Hp8t6au8B
> xQueZThJWjqQ4v8pyLnXF6OomKiDR24OTXMCrFgDkcmZ7RK2ALqowI3tQVwLUTuI
> yUN0qL2z2y+LyTcO0CYf3Lple8KlgLAXYMsv7pGLsOvhS7BW2jW97/bcbpUNxoHb
> eghxqbIEnyRImUbbyg+nW7VVk65RKdPUNkBPXfQ2NMVwe+SDE5Rl+NXNVqDNjGad
> soDTUBrD9yXkWX+4s0myleE62UzzH5nYgGPQeQgYmzWgq7LybH6WBlbQK9D7ODJR
> Cw3LCq1hwZZ2w04Yx+XwMHquGJYHW8L2pj77h95uhzksz8buKnM0AGwBCTC6RMoi
> AyUQvdc=
> =JUWl
> -----END PGP SIGNATURE-----
>
> commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 5 14:44:06 2026 -1000
>
>     Linux 7.2-rc2
>
> diff --git a/Makefile b/Makefile
> index b9c5792c79e0..b4035d3cef26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 7
>  PATCHLEVEL = 2
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc1
> +EXTRAVERSION = -rc2
>  NAME = Baby Opossum Posse
>
>  # *DOCUMENTATION*

