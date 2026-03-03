Return-Path: <linux-doc+bounces-77729-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BvUAagap2m+dgAAu9opvQ
	(envelope-from <linux-doc+bounces-77729-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:30:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA31F4A12
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3913013AAF
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11A23DBD66;
	Tue,  3 Mar 2026 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nAzmt1p/"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA203D75B4
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559012; cv=none; b=STTVLk14JFNs9Aydyl4E4C820OHWJKhAMRmERda2tsTTGUM83F+6lYHIYDB7Bs94hJVA1zpuhA/ZnSyvrgOf8kbp/WDqBsmDi2twpvuXXNhZyKmf2c2t3McL9Z46d1mH72BWFUL42Tx1zzCRBaed9s/enF0c7Xd6yb1vngA6rIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559012; c=relaxed/simple;
	bh=dMaZYcHxUEhcRbbRFCCepqXtX8ttnrVtNFwlIE97NXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Re4x095ofjE5pA0EBUsWYOxOu/vHaovaeuGs7LFwvyBlAhUkg1PjyGWDhic83FA7CkSSXQomfI6h5d6Bosuu1TB1kwG8mkRLV9cjzhLkrWdFhbu1i5hYB2JkYJ/o0/8SyKKJwIkhQXPFBHTpsrIIB1hlxjm8rPWDB1GpsxUQ4O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nAzmt1p/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B155B40429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772559010; bh=077hVLoVVdYyu38QOl1drGCiRNwO7rRWqH/h095pg3w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nAzmt1p/mHkDPJt9k2Jf2F1/ikhO4pCZbTRlluF+BLaWi+94BIClwt7CiQdFPDhBm
	 vepxlwHJMNhn5nDxLPMmw+wYvxg3kf1ASuzNlwE04r67T8hHd2b1FLzLWrFH18Zs4w
	 HYMu/9n83fw4/0thaK/Bz8OsRunUf07mgqoisRnGXNJWHWi+/2VwCam9Om2b8dFmh1
	 Zg6DaAXskmbRszx4E/67CNoaFYWIAOOHdsvQfEVmMyNUGXD1qHO2kInvfhMcn3lfD/
	 AgShLSVnmFieKQtBkn2r69RvIAZUH42naAHHcCeqwNjqZDrBDtZeNjAkqZfmUXdTAk
	 crqceDx3rZRUw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B155B40429;
	Tue,  3 Mar 2026 17:30:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH docs-next v2] docs: pt_BR: Add translation for
 maintainer-handbooks
In-Reply-To: <CAMAsx6fWycCTf5p4sf19PHROGRaSHn-ixo8GsMh_pno7rR+C+g@mail.gmail.com>
References: <20260226225849.268373-1-danielmaraboo@gmail.com>
 <87o6l4dequ.fsf@trenco.lwn.net>
 <CAMAsx6fWycCTf5p4sf19PHROGRaSHn-ixo8GsMh_pno7rR+C+g@mail.gmail.com>
Date: Tue, 03 Mar 2026 10:30:09 -0700
Message-ID: <87o6l4bz32.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 59CA31F4A12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77729-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

>> > +Notas sobre o processo de desenvolvimento de subsistemas e mantenedor=
es
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +
>> > +O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5e=
s espec=C3=ADficas de
>> > +subsistemas que s=C3=A3o suplementares ao manual geral do processo de
>> > +desenvolvimento :ref:`Documentation/process <development_process_main=
>`.
>>
>> By now you know what I'm going to say here...:)  That is another useless
>> top-of-the-file label.  I won't insist you adjust all of these (I've
>> applied this patch), but I will be removing this label in a patch of my
>> own.
>>
>> jon
>
> Hi Jonathan,
>
> Thanks for applying the patch!
>
> To ensure consistency in future submissions, could you please confirm
> the exact label you intend to remove? If it is the
> SPDX-License-Identifier: GPL-2.0, I should point out that the
> checkpatch.pl script usually mandates its inclusion.

Checkpatch makes suggestions, not mandates.  But no, I was not
complaining about the SPDX tag.

> Could you be specific about which label is no longer necessary in this
> patch so I can replicate this in my next submissions?

The problem is the :ref: usage here; that should just be
"Documentation/process/development-process.rst" without the label noise
in the target file.  See the change I made in

  https://lore.kernel.org/all/87a4wode0a.fsf@trenco.lwn.net/

Thanks,

jon

