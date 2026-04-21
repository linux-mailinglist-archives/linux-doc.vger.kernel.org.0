Return-Path: <linux-doc+bounces-83916-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKF/Az3N5mkr1AEAu9opvQ
	(envelope-from <linux-doc+bounces-83916-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 03:05:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B9435376
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 03:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 412A830107FF
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 01:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9751DC1AB;
	Tue, 21 Apr 2026 01:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b="ADZ4PFr0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A318FDDE
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 01:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776733487; cv=none; b=ZiCslLmKzTIopKIoOZZu0urbKwhMz+Up2I4zBBIQRejJpVNtGPAxGELuyQvBMl7ENgoPave3Y7forFM3SqD/R7mxlf+i0GxqLbFXsW45shzUqsIfnh2lcX8mWXyBnO1veDuTHGGrwd8CiU7ppI5Q8RIlYahEeFGJriCHU4sjtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776733487; c=relaxed/simple;
	bh=gkFNkdmvdKEts7yRgdVBxuFyMrzs7CXq96VbqoGR6vE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdI/Bcy7pr0o5RgU+c66AbyakRsySVXGoUt/cT0RMjqdskDDs28ipg6rSR0b25CuczYEwvOWtDULbTQm+UuTrEBQDqkNyYrE4/rV1YnGRZ4mTCYAevSqtoogC7kNjgDJ9lS26oW3BJ/ZxkXO20wLKUn95+6K7fH5Fpb58z9lEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com; spf=pass smtp.mailfrom=truealter.com; dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b=ADZ4PFr0; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truealter.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=truealter.com;
	s=protonmail; t=1776733469; x=1776992669;
	bh=BUgSo3jQ6u0wqWOPlFUrYRozqt5hVKqIdfN34DvYi3Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ADZ4PFr02BClyWy3sNSsHvMvBvdDANy2i/Z4PuJUilNu3liRFLIrLCIoup2v1+RvT
	 1wQNjo0uqSPrkPafK5GpOn9kQTNFpPvnW8ydYEPCPGoVd2qUhyrxk+27b7qmmnag5r
	 nbLsDAY41did84dr+yTZTwyq3Ck6uhjyzfw6IGeSQd9Wscx319JEIJzFMLPBGUW4Tr
	 7X3QOJomSKVyT/Qk638LNoMQnUAxOWr0wohUyq3UvppR30hEQPa8WZiFBxZYjNMfJG
	 RPlr5r6JF6yL7k5vB04NSksjZNI5J9yVOToCR1JWaKza8yLYlrhGuT2C59Gj7EQN06
	 bW0V1srDnI0lQ==
Date: Tue, 21 Apr 2026 01:04:24 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Blake <blake@truealter.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By: trailer
Message-ID: <IF6AC3bPCYsGyyxsgSQlwZXnA3BJJh61OW6a3KznzbsmDPG4DtricBAzsxyOjDQZ-RHBEkgsjRdaVKQ6i8gqv1bd2AGwC0BTJwBErNHOqx4=@truealter.com>
In-Reply-To: <2026042035-retention-platonic-e5d5@gregkh>
References: <20260420142741.3187814-1-blake@truealter.com> <2026042035-retention-platonic-e5d5@gregkh>
Feedback-ID: 187617253:user:proton
X-Pm-Message-ID: bf76b1cc5c0127393096e6777cfaf8486632070d
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[truealter.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[truealter.com:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83916-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[truealter.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blake@truealter.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[truealter.com:dkim,truealter.com:mid,hostname:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,desktop:email]
X-Rspamd-Queue-Id: 614B9435376
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, 21 April 2026 at 3:40 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> I really do not understand, how would this actually be used?

Git history uses email addresses as the de-facto identity key and
email addresses aren't stable across a lifetime or a career and,
increasingly, aren't meaningful even within a single commit.
Contributors move between employers and domains over time; companies
rename and migrate their workforce onto new domains; and plenty of
commits land with From: lines like blake@desktop or
root@localhost.localdomain because git's username@hostname fallback
fired before user.email was set.

.mailmap partially fixes the first case inside a single tree but
doesn't travel across repositories and can't synthesise an identity
where the From: never carried one. A declared Acted-By trailer gives
the human a stable key that survives employer changes, domain
migrations, misconfigured clients, and cross-tree lookups.

> And as you have to have a signed-off-by, why would you use two
> different names for yourself this way?

Signed-off-by and Acted-By answer different questions. Signed-off-by
requires a real name for DCO attestation. Acted-By names the stable
working identity the same human operates under across contexts =E2=80=94
which for most contributors on a stable setup collapses to the same
name, and the trailer adds nothing. They diverge when:

  - the same human contributes under different employer emails over
    a long career;
  - an employer renames and migrates its workforce to a new domain;
  - a contributor publishes under a stable pseudonym but their DCO
    Signed-off-by has to carry their legal name;
  - the From: line is machine-generated noise (blake@desktop,
    user@hostname) and carries no identity information at all.

> And who is asking for this?  Who would want to use it?  How would
> you use it for this very commit?

For this very commit I wouldn't need it as Signed-off-by is
sufficient. The patch defines a slot in the docs; the commits that
benefit from the slot are other commits in other trees where the
divergence cases above bite. Pseudonymous contributors and
long-career maintainers whose email addresses have changed are the
current constituency; anyone writing provenance or review-routing
tooling that today falls back on email-fuzzing is the other.

If the sense is that optional trailers with narrow audiences don't
earn a footnote in coding-assistants.rst, I'm happy to withdraw and
keep this out-of-tree.

thanks,
Blake

