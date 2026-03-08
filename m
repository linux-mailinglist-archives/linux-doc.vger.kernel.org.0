Return-Path: <linux-doc+bounces-78381-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNC1I1rXrWl+8AEAu9opvQ
	(envelope-from <linux-doc+bounces-78381-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 08 Mar 2026 21:08:58 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F6232130
	for <lists+linux-doc@lfdr.de>; Sun, 08 Mar 2026 21:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278013011C59
	for <lists+linux-doc@lfdr.de>; Sun,  8 Mar 2026 20:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3407834AB17;
	Sun,  8 Mar 2026 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="RkEzPWyj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CD33B6C4;
	Sun,  8 Mar 2026 20:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000433; cv=none; b=f24L3Hk1eeXtxbfSBzE7Rp87YFYYo5Yhn+eTF711PSqNYrL6EX9jQwY6MpNbbleUF0pomn7ndXGGokpb4qqeKlIuGUtwwq7J5LKF1Rrq9//dRVesd2d/LE+49viVD/J7fTEMGmi2miv8FQg6oAPl3nnntTNhompOXF8H3XP6W+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000433; c=relaxed/simple;
	bh=MlZuYJqshUy1ZHyLqTdJliuzfXWtREalgh8JNHYmzKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ugJWNd/7YJY5aUUQjtWmCmpgAnAQvnkKwSh3MHlLNFSTrU8PH2wU288ZWOJy/jZBk70qqzMYvPc56xz7ubsdC1QFAh8VMCw3zQXSLDvGDMX1o1TDnuqc6aPa20TSK2GI2aSg5RtWXI6pdx4vHU1tOF7spqHnlbzWJjybsbEzz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=RkEzPWyj; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Message-ID: <55df12ee41de28943298a1e2973d69573edc09f2.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1773000420; bh=MlZuYJqshUy1ZHyLqTdJliuzfXWtREalgh8JNHYmzKk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RkEzPWyjsSdSOwZyvdLFGtVOlEgmnWx+BhlubEfuQCPVpqLk/yF+0lJtL53ei0DHP
	 MyHWrY8y3gPMMNs7GN2eeOx3c9mLXqL0edEDLar5m5z/Tbd4fqabsmwI3ay3BUDCwC
	 iS9kHu1bnZD604l9oqHJ0FUJHSa11QXz4jy0QAvszrHEV5vijyAcFqPX61HxK1TBRD
	 P2Vz+Kf/oedcnxDVHPVkOHUfX6LoldBsGHEUPYhWGAiH+J1LHqiK6VgtVfPBnRZVpn
	 3unZ7LWnbhvdSvqxa8wNmBj2vENNM9O0nLn2+vxmljBzon9Aerg4YV2aPXgtcYFbMX
	 JzFcUX8A7Lceg==
Subject: Re: [PATCH v3 0/2] workflow, scripts: sort changes.rst and ver_linux
From: Manuel <manuelebner@airmail.cc>
To: Jonathan Corbet <corbet@lwn.net>, Collin Funk <collin.funk1@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 08 Mar 2026 21:06:58 +0100
In-Reply-To: <87ldg8af2j.fsf@trenco.lwn.net>
References: <20260302182405.86829-2-manuelebner@airmail.cc>
	 <87wlzsdf3o.fsf@trenco.lwn.net>
	 <8dec205e406364d14f7ddf3ea11695407a7980b4.camel@airmail.cc>
	 <87ldg8af2j.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1B1F6232130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[airmail.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[airmail.cc:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78381-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DM_SURBL(0.00)[airmail.cc:dkim,airmail.cc:mid];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@airmail.cc,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[airmail.cc:+];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 2026-03-03 at 12:27 -0700, Jonathan Corbet wrote:
>=20
> > > - Why my request to separate out the logically different changes were
> > > =C2=A0 ignored.
> >=20
> > I split the patch into a series=C2=A0like i responded on Tue, 24 Feb 20=
26
> > 08:13:02=20
> > > > i will make a Patch series with the files split.
> >=20
> > Do you want me to send two patches, which are not in a patch series?
>=20
> No, I want you to separate the logical changes.
>=20
> - Sorting the entries in the list is one logical change.
>=20
> - Adding new items is a different one.=C2=A0 If you mix it in with the so=
rt,
> =C2=A0 nobody can really see which items are new.

so I got that. I have a follow-up question.

should i make two or four patches?

[PATCH 1/2] ver_linux and changes.rst: addition and changes
[PATCH 2/2] ver_linux and changes.rst: sort

[PATCH 1/4] ver_linux: addition and changes
[PATCH 2/4] changes.rst: addition and changes
[PATCH 3/4] ver_linux: sort
[PATCH 4/4] changes.rst sort

Manuel

