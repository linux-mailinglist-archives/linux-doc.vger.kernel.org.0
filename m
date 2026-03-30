Return-Path: <linux-doc+bounces-81781-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LpFLw2nymmx+gUAu9opvQ
	(envelope-from <linux-doc+bounces-81781-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:38:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019F35EE82
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78195300BDB5
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 16:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A7E3815EC;
	Mon, 30 Mar 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QulHzJsM"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0B199D8;
	Mon, 30 Mar 2026 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888570; cv=none; b=e0xnNd9IzEMKXt47vOeG4HLrCTaHdTuhwtU+6tEyg9HpPmigBRz6ivXu8XH0+cTTr4Nm6aqMaSObw6Go06vi8XmiQs5IA3l7etBs8oXGxGrVStAYOXVdAhrhDpw+7+C1dNug2sA2aCA8usUS3aycuIWfhOLlPpQI8GBQOjaSf6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888570; c=relaxed/simple;
	bh=3qetewScn/TQCYpBjuo9uD3rRuvaLSTRDn3UEeFHvfs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KdH4c7lc2JSNcVu1NppTDkPIbDs/CwZJEPIFForGE2i3d5rQrVOCn7/2TPIuEK6qFq238l8OKipcu7oL1tob6Gqq3WN5KfaP5yZJsGn805vXMTByUk/rgDDsBE95K07jIORZF+Cp3AJpf+upR/NxUu4UUW9gnrW8GgRQ8l6l9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QulHzJsM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C151A411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774888568; bh=NCoj7HdnGdo5RhRTBvbSwlXWfM7DgnKeEjKlMQGRTG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QulHzJsMT7tWkQwTnS+GDq2iNm+WZqxSw7Vk3AvYsAgrcnYriLzMuLADj9dmoFUPI
	 QK7TrS5NqDNmzcSUbQ10ANdHdi2boE/y6CgD2SSa1K4YQ06H2gwvmli4uX/x44gdZv
	 WAOdjoMt4BUVPXNsDsjg4N2QlqOYhNPMz+nzYqzNu0RTK5E7Ad8CF7hp/tubFGCFhG
	 9c4TYgJkQ3EL7f9PHA46tFSjjpQ7R2iweFBE1hFfTVrxho6gj4rT8jZ9LD7tYZsHaY
	 eQW7Y4cKPuqyT0nH7loRfkrig1oT/1ZIVwQk97wWiPmzzw3amrqYbhjCalvKhRzFqY
	 FosZsf67NhNsA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C151A411C2;
	Mon, 30 Mar 2026 16:36:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v5 1/2] workflows, scripts: harmonize and cleanup
In-Reply-To: <20260325194616.78093-2-manuelebner@mailbox.org>
References: <20260325194326.77923-2-manuelebner@mailbox.org>
 <20260325194616.78093-2-manuelebner@mailbox.org>
Date: Mon, 30 Mar 2026 10:36:07 -0600
Message-ID: <87bjg5nuko.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81781-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim,lwn.net:email]
X-Rspamd-Queue-Id: 3019F35EE82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@mailbox.org> writes:

> cleanup and harmonize output of scripts/ver_linux and table in changes.rst
>
> ver_linux:
> fix path to changes.rst
> Add missing tools in ver_linux
>  bash, bc, bindgen, btrfs-progs, Clang, gdb,  GNU awk, GNU tar,
>  GRUB, GRUB2, gtags, iptables, kmod, mcelog, mkimage, openssl,
>  pahole, Python, Rust, Sphinx, squashfs-tools
>
> changes.rst:
> add reference to ./scripts/ver_linux
> needn't -> do not need to
> add gdb version 7.2 as mentioned in:
>  Documentation/process/debugging/gdb-kernel-debugging.rst
>  scripts/gdb/vmlinux-gdb.py
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Applied, but the changelog now reads:

docs: changes/ver_linux: fix entries and add several tools

Some of the entries in both Documentation/process/changes.rst and
script/ver_linux were obsolete; update them to reflect the current way of
getting version information.

Many were missing altogether; add the relevant information for:

 bash, bc, bindgen, btrfs-progs, Clang, gdb,  GNU awk, GNU tar,
 GRUB, GRUB2, gtags, iptables, kmod, mcelog, mkimage, openssl,
 pahole, Python, Rust, Sphinx, squashfs-tools

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
[jc: rewrote changelog]
Signed-off-by: Jonathan Corbet <corbet@lwn.net>

jon

