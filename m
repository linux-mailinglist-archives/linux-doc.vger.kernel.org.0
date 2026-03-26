Return-Path: <linux-doc+bounces-81478-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKuLOmi7xWkeBAUAu9opvQ
	(envelope-from <linux-doc+bounces-81478-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:04:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446F33CE20
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A8303055D7F
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 22:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AD4336880;
	Thu, 26 Mar 2026 22:56:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FD25776;
	Thu, 26 Mar 2026 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565794; cv=none; b=kZLSWKSE3gnE/QTuSEUhobiSMw3cYgKvtaSjJIZgXJwlI9EqNfI2HMDBpkwBrwyADcKpSi59jVyNX6X9zubPRc+dKPuNiOkZ3XlfqG9LGHpAVoPhflt+rUGkYxCFv4qCalkZptTUNNCSWKtH8f+RhZ9lcNVKuWEJ5Yu9Gktcfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565794; c=relaxed/simple;
	bh=72EKfGGi+Z9MGVMyBYh4IjtJLRu+H7K5JVyi/aWQHvE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqcdZ1K6KvMeKHsMOZFt8bfklyA8TUGlcN+YiB5FtliNyQWWmHxCsJheJESYVfP8x49Yr2GGurhv3PFjkqe8N6mKfD3iYzmoVuddzUjrN4BjVdSrVkVYmoUaA2vWx442e9bqj7xKUrwDFACGsH5EiccUKOFc5M5ygD7mPopTdi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id B6253BD2A7;
	Thu, 26 Mar 2026 22:56:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 029FB17;
	Thu, 26 Mar 2026 22:56:27 +0000 (UTC)
Message-ID: <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 15:56:27 -0700
In-Reply-To: <acWnbG3nGjfYeYXh@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
	 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
	 <acWnbG3nGjfYeYXh@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: ikgjjuxs8nrd168jsp6cx1q4m8gpp7ha
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+/Ny20A76RkOGaknaAmFtavrWk/tKo/ZY=
X-HE-Tag: 1774565787-261062
X-HE-Meta: U2FsdGVkX197hr39B9QuZBXHrREZ/y4EWpeSo1uBh/35OcP1LCNM6/+UWFc6KjqvAhTTdDPIdrdWjWDpWjYNJEuejpAi0Y5xm52r2XpZ4ZPGyuT6/Lm20c5omLiSB0goiTeh0OhgfCDxpjCAZq3Mdk04vQPaEH6Nk/ZoiVGNjy76CuPlUsm8KI5jjx7XP37MWaTyKAAtqIjpvChNTRqsIr23irwv7yCut4Xu5foF9nKT7C5bZzBNkEnE22ngeDK/c8ncd+0XmrJf8iKlHCMiYkqa07C768QQtrWUalnQDKlg79wtgpQqNORGlig817m3
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-81478-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[perches.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,perches.com:mid]
X-Rspamd-Queue-Id: 7446F33CE20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2026-03-26 at 14:42 -0700, Dmitry Torokhov wrote:
> > > Because when I am editing a file I am not saving it all that often. I
> > > want to have buffer diagnostic updated when I leave insert mode in vi=
m.
> >=20
> > I believe you are able to keep your own version of checkpatch.
>=20
> As well as my version of the kernel, gcc, clang, editor, git and so on.
>=20
> Do you have any constructive feedback?

I gave you feedback.  You elided it.

> Right now checkpatch is broken
> when using "-f" with stdin and I offer a fix. If you have a better way
> in mind by all means share it.

Note the name.  Feed it a patch.  It works fine.  It's not broken.

