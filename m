Return-Path: <linux-doc+bounces-85324-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC+RL9N+82nH4QEAu9opvQ
	(envelope-from <linux-doc+bounces-85324-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 18:09:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD104A567A
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 18:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1B633093D8D
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 16:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3647B47884D;
	Thu, 30 Apr 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m15GH11i"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F24779A1;
	Thu, 30 Apr 2026 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564976; cv=none; b=XuCefr0eHqf41awdW1540qSFJxGa6xhI81wu44kYGCKSA3u1CJI375Q3Z1lINl57Nt4A4TXpY09LTM+DTFqjbIUlvQmQ4X9dE5r9snre4st2TiTCRv33LZ2TcCq/oIjgFDAQQjc50BTov/MoFUTbe4RWcDGDs1xfhoC7hC3pBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564976; c=relaxed/simple;
	bh=64ja9oHCn5DeohUNhiC+0I/15Q1PE0GYQJoEQaODMyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oeQimrtnePbS8mfUf2sdbEzG4n4dTNg0mCm2WVD3i23sfQuatknw0BRV/Oa7WAlcYcYLgh6UgAAPSdMwbtlZw4TC1oN3AaZdYwUg1+yz5ZIZ8NNctKEnC727qsbNdgtAkrvTbJm6MS9S6day1vyOY7IM5z+U1BSikmLSZA75ViM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=m15GH11i; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E04DF4108F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777564968; bh=64ja9oHCn5DeohUNhiC+0I/15Q1PE0GYQJoEQaODMyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m15GH11igDic1dSQ2LSbhK4SchROKmFVdli12U82k7/KPymSHLST9AG+wThqArB9n
	 aHiGBeMKLzKmgbO0XqNfubfH49OgjX/NLxLQEBWDBWB9csieeaNULfu2xWZlxmWQ5N
	 7oonwF6e8V8EXjuqulXvU38FGnCkZfjw6W0+66fqO8pjaowTPSIrZVWimqx//5S7lB
	 A/i1uhTrUhLvnIYH5imZ0xmuhVQHXCNMkoSBf/X7Upd2RfhUDEuiWpwj2F8x3bg9i4
	 BfiLsL3xNd+uhJasdIgy+LXCFUL7oaaU9QykTLKiaAjy071+0hy5p1HL7SUcEqVcus
	 UJNPN6TQtsMVQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E04DF4108F;
	Thu, 30 Apr 2026 16:02:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Dar=C3=ADo?= Ortega Leyva <darioortegaleyva@gmail.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: improve formatting and readability of the main
 README
In-Reply-To: <b0f3ab39-ae35-4a4b-9333-29d78ca58a15@gmail.com>
References: <b0f3ab39-ae35-4a4b-9333-29d78ca58a15@gmail.com>
Date: Thu, 30 Apr 2026 10:02:44 -0600
Message-ID: <87bjf0h1wb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3DD104A567A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85324-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]

Dar=C3=ADo Ortega Leyva <darioortegaleyva@gmail.com> writes:

> Restructured the main documentation file to use standard Markdown=20
> headings instead of underlines for better rendering. Added anchor links=20
> to the "Who Are You?" section to improve navigability for new readers,=20
> and highlighted the AI Assistant warning for better visibility.

Kernel documentation is in RST format, not Markdown.

jon

