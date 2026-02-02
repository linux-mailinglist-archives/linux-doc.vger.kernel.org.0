Return-Path: <linux-doc+bounces-74898-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACB8Ip/XgGnMBwMAu9opvQ
	(envelope-from <linux-doc+bounces-74898-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 17:58:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F02ABCF40D
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 17:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9457C3004C5A
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 16:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B992842AB7;
	Mon,  2 Feb 2026 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lgMr+7Aq"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836011400C
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051346; cv=none; b=lekrStFVOI0C+dYeeoZbDALVaNoYOwhqqUprgR6z3P+VbnrbBME4KWEUvOT3pezhp3YqmRADLtA07P1p0iFR5zu5+gvPieztDVMV7prPG5Q/Q3dWhUyiUOu70NajYq6QL9PhpPC3Pmad6phRUemNaiqGYJWVCl5vdi1+Z1tsy8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051346; c=relaxed/simple;
	bh=izmIAXPShoaTyytRK3kmXdEjJsAUHdx9l4Kqx84eewo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AciC9L+04LAOhm54GBI4SqOOa3Y4hZvFefXGGIw9wUH1YqzOyO9U16s/Wysrrw9GtbLOiunYQbPzRucmlzeS18hojbJOV6N9CNv6JIsv6C8rNmpT8wgdAxfUSG5YIg+suGjzUOgqNMtkJJ++MqHoKHTzqGk7RfI8c8Z36YFfeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lgMr+7Aq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A1F2140422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770051344; bh=EfUbufXmzzkialBTb6Nx4vtZb8qdAeWmtL0WWVRc7NA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lgMr+7Aqkv9Xjp81WGfrXR+DgbKXFkRx7UO95mv/cSu8Ql32SHBCzGxHdTO/36ELi
	 aQd2zK+Zj07/ZjkiZp4RVav1BEB0fKuZrkcKc33VzCSWFsWtpCg1WipSs9Tgi5mMWl
	 Ct7/5hpMzg5WMYlXhMPNaJDK1/BoorVKuWLgYgyrhuBgXmVGqOyylEsFdoiM/i1jCh
	 M0/Db5h5IwwuCbv/OeK+JcJhrAGlrVk2LyaMu4MgPI0bPE3N2syPBbDBlMPPNlljfS
	 w+dXkAyZbzSI+HmVnDC3SxUVB0WSTxdo7sW99CVa62AV5rc9hCtmy/FrSueM2ExMkA
	 z5FtRvMvhiTAw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A1F2140422;
	Mon,  2 Feb 2026 16:55:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: linux-doc@vger.kernel.org, trivial@kernel.org, Rhys Tumelty
 <rhys@tumelty.co.uk>
Subject: Re: [PATCH] docs: fix 're-use' -> 'reuse' in documentation
In-Reply-To: <20260128220233.179439-1-rhys@tumelty.co.uk>
References: <20260128220233.179439-1-rhys@tumelty.co.uk>
Date: Mon, 02 Feb 2026 09:55:43 -0700
Message-ID: <87jywvrsog.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74898-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: F02ABCF40D
X-Rspamd-Action: no action

Rhys Tumelty <rhys@tumelty.co.uk> writes:

> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
> ---
>  Documentation/ABI/testing/pstore                           | 2 +-
>  Documentation/admin-guide/initrd.rst                       | 2 +-
>  Documentation/admin-guide/kdump/kdump.rst                  | 2 +-
>  Documentation/admin-guide/mm/nommu-mmap.rst                | 2 +-
>  Documentation/arch/arm64/arm-acpi.rst                      | 4 ++--
>  Documentation/arch/s390/driver-model.rst                   | 2 +-
>  Documentation/arch/x86/shstk.rst                           | 2 +-
>  Documentation/driver-api/phy/phy.rst                       | 2 +-
>  Documentation/driver-api/tty/tty_ldisc.rst                 | 2 +-
>  Documentation/driver-api/usb/gadget.rst                    | 2 +-
>  Documentation/filesystems/relay.rst                        | 2 +-
>  Documentation/filesystems/resctrl.rst                      | 2 +-
>  Documentation/firmware-guide/acpi/DSD-properties-rules.rst | 2 +-
>  Documentation/firmware-guide/acpi/enumeration.rst          | 2 +-
>  Documentation/input/gamepad.rst                            | 2 +-
>  Documentation/process/adding-syscalls.rst                  | 4 ++--
>  Documentation/sound/hd-audio/notes.rst                     | 2 +-
>  17 files changed, 19 insertions(+), 19 deletions(-)

Applied, thanks.

jon

