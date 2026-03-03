Return-Path: <linux-doc+bounces-77762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDNxD59Dp2kNgAAAu9opvQ
	(envelope-from <linux-doc+bounces-77762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 21:25:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D942B1F6C26
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 21:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3A47303BA1D
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 20:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F0A38910E;
	Tue,  3 Mar 2026 20:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GTQLoqw3"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F2305057;
	Tue,  3 Mar 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569498; cv=none; b=W7QdEyIctHX8LiYtMGtg7BTxr2k/J7/Bie6LPsV1Wdalp92sQZumAeg64aY0fdhYri5afs+X5ESJGIsZ2Ujh07ZqRqTEPxzux2aPqkUyvCEzhpQ0TaHP0KJ14IFmA3J7Ql4hVjE/sozcTEEZEpuTdW0OrJs5KP3eS072INrKKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569498; c=relaxed/simple;
	bh=3aPi2l8EjR4JqJ95n72nhW6sv8OBSiH7eAYZ2vfcHR8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R9RrX9P/efBwF09GjxK9UdLUOLzAEdc8BSAUJme30KinO8hB3wFDKyEwez/i92TuDdCkajeT2D9lP0nRfEd6ow+2pFSm9omp2pUIQ6MncqvhwuH54PJ8uUYPzSoTmi1HiLeJ5xc2V/tP865DdSnahkc01i/vr40x0dQVKAGYJ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GTQLoqw3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8281F411CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772569496; bh=rq6EYDAek4tcX/rjsPkWM3+2P2k+fk7lcFISXbLPL1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GTQLoqw3IzPojAhYLlxiAtInPpE5LbxbgDj1v/Dz6yxJP4zz+WZ5+lXR5McqF/2kL
	 su4ECrn26MnJOkOra3HmMrrHUUyHB10Rn3746oLX1PdPSXEkOIwYpsCZit27eg/F3Z
	 I7yocmCYKbgRM3hQ8c3vmV8fEiONmtVS2ElOoVFIHFYOFEp/1HDfYp0ju8uZwy2a62
	 su/UJmKIdqNw78fUhJ/gyr9gQgEDBAJpo196B67JEOfkWr2JKgge4db9esMyTEHMVv
	 xeWOdxqlZtoCoLkzb/lkz3zIpx9tzAOY5b5X7htowpeMm1YR7KWe4GYJpf5IsC1Dn5
	 Ui190+HL40nNA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8281F411CF;
	Tue,  3 Mar 2026 20:24:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [PATCH 08/18] docs: kdoc_parser: fix parser to support
 multi-word types
In-Reply-To: <20260303211951.0e2b7faf@foz.lan>
References: <cover.1772469446.git.mchehab+huawei@kernel.org>
 <544c73a9e670b6fef1828bf4f2ba0de7d29d8675.1772469446.git.mchehab+huawei@kernel.org>
 <87jyvsbyvb.fsf@trenco.lwn.net> <20260303211951.0e2b7faf@foz.lan>
Date: Tue, 03 Mar 2026 13:24:55 -0700
Message-ID: <87cy1kacfc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: D942B1F6C26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77762-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Heh, if we start using a code like the tokenizer I'm experimenting
> here:
>
> 	https://lore.kernel.org/linux-doc/20260303155310.5235b367@localhost/
>
> we could probably get rid of regexes in the future, using instead
> a loop that would be picking "ID" tokens, e.g. basically we would
> have something similar to this completely untested code snippet:

...which has some appeal, but I will confess to being leery of another
massive kernel-doc thrash; it would be nice if things settled for a bit.

One can always dream :)

jon

