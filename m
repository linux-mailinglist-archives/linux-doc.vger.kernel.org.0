Return-Path: <linux-doc+bounces-32690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A859E9F122D
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 17:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78FE282A45
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 16:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7111684AE;
	Fri, 13 Dec 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KPlOFXES"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316757C9F;
	Fri, 13 Dec 2024 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107449; cv=none; b=SzAe5kYdTFL1hQeAkUNeCNpSQZSVrAMTt0ruk3W2bwfJzTl9oVb8Pv1zQNtRIkmb3HwPldchXzjtrQqI7cCE5wlBjZ0QlJeU77c8/M7EiRsumz6zqk6AeOE7Kun9G+3YQYKDSK0BaJ7Fk44kLCdj+TTCpcRu3JceR0h5Kwkw2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107449; c=relaxed/simple;
	bh=GljLzM6SDuPsSffCkf9qLx2JblnCq3ZfS/3Yg62bCfc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FTb/rlvJeO0ex+q9cUddcKMk3mQ9fyWEE1XTwQbFYo8tvfPCE2nUZfSsEb1pH0g+I6HyrrS7554EUmIabsTI0BP9YuMB9jmWnNAPGvbKAYibHCzpyaPrdFAh9Sd+HjSJjLfJSHx053K43XnC8GAaeSScksaQ4MVOgZ6HA5GwBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KPlOFXES; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B90CC403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734107447; bh=GvK3NtmRCIWm3d3RaqEaVNK7jQcMPYtYCwTxhGc9q4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KPlOFXESToSVcU48CpP9qRMRQdOEwVGDKw865QKXXIhjSS7QdYXSPe2qLZn7cml0d
	 GX13ILAxboW715fiC4ovfwmcq6kAh703YlMfzVbhAEAUmerPj4jAJeLcK6rRISXe+b
	 pC4v3RRlMr4LZDp/kcHkETWWBdQQDEUSEn3QwkfryI9t1qk2F7ZKWhrbpqiSvJBBQC
	 Cxzv3ZVPVlXT51ZEKtHU2uUZHQVdZUGOogZhyQ2IfFYpPqmjDVXxYGT088t92MoltC
	 BQlkXN7XRRbORFWWo2SnzD/8z17xcMZOCdou9zim0wzwcodmm0K0SUTI/0xRLdyZA+
	 9lAZy3MuP45yg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B90CC403FA;
	Fri, 13 Dec 2024 16:30:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 6/6] docs: 6.Followthrough.rst: advice on handling
 regressions fixes
In-Reply-To: <e7344ff7a57b61380152defaa5ec13f06ac5d7d0.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <e7344ff7a57b61380152defaa5ec13f06ac5d7d0.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:30:46 -0700
Message-ID: <871pybwnnt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add some advice on how to handle regressions as developer, reviewer, and
> maintainer, as resolving regression without unnecessary delays requires
> multiple people working hand in hand.
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  Documentation/process/6.Followthrough.rst     | 24 ++++++++++++++++---
>  .../process/handling-regressions.rst          | 16 -------------
>  2 files changed, 21 insertions(+), 19 deletions(-)

Nothing really to complain about here (though I do worry a bit about the
idea that calling something a regression fix allows bypassing all of our
usual testing).

Thanks,

jon

