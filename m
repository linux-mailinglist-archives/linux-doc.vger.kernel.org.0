Return-Path: <linux-doc+bounces-92402-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LRhKAncTMGraMwUAu9opvQ
	(envelope-from <linux-doc+bounces-92402-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 17:00:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B416876DC
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 17:00:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=PC0UCGGY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92402-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92402-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D671303B193
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 14:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B1E3F58FC;
	Mon, 15 Jun 2026 14:58:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E42153EA;
	Mon, 15 Jun 2026 14:58:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535523; cv=none; b=lsNEqkYQyvfaQMxr+KrAy9GtR+Zov0cPOzmECeOuhTYqPyWcfz/Om7BneGt7a8qdJJYlTTQZ9YOGRRXGZ2xJBxKWspOeZTN2K90E1AdnH9jqCbwtZGveCu4pZNgfc75nOUn0INbJJ33pGRLLZ71FDHtbDSUZ9e3/4xYkETV35Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535523; c=relaxed/simple;
	bh=gLobkqqLmgLevCDLJNxW6jVb9pHs+UE9NmjOS9c+o7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZbVCA+7xbznBFl8bDowz65dX8h9gYIWel3HdQQDYTDInjsRsFyc81YWXy9bLDguvmOgtu9ZH6Cy+KQqL4sppcFK7q+KoFhCmLAh6niM6ePwdYku5yVPRAPuMNwoDgJvTmdPyKg7/VY2goxoFSSVXk3i89A91pa8aZaT3jInWmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PC0UCGGY; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7167040430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781535515; bh=A/WCEYhquO1DFb2bk3Vy6AiRUGYQ1ZI5QBk77/Axasw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PC0UCGGYazcRyWfBP5Co4tRTwTmdqJ8vuqIhTozE4Zh82TCHQU7IUjcn7SWoP6Ft1
	 LzON+oNce4Y58oPO5M7OVk+pAVtYhSfwV3fHRsCr9T48hfT1OsAPZ0EN8TIRqIGRUl
	 j5ydivTr48FiqBC4tDDA+twyRH4MKi59AZENKvQRzEAoLD2s46UsRoed73uhjOQZoM
	 RETQgHJWddSNL9UlKW6I7L1zKIbG9K4siiqbUpTs2rXCpiO/yirpztHGFl3kT3HkUN
	 d/NR1zLp0pcRfloNpkXXm8pVPB0i27jC0Rf315jUSQC/NVhKI5sK8kFz5GCV4/A/Gv
	 7iOD0bkZPtdzA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7167040430;
	Mon, 15 Jun 2026 14:58:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Dan Carpenter
 <error27@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Stefano Zacchiroli <zack@upsilon.cc>, Steven
 Rostedt <rostedt@goodmis.org>, Laura Abbott <labbott@kernel.org>, Julia
 Lawall <julia.lawall@inria.fr>, Wenwen Wang <wenwen@cs.uga.edu>, "Gustavo
 A . R . Silva" <gustavoars@kernel.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Dawei Feng
 <dawei.feng@seu.edu.cn>
Subject: Re: [PATCH v3] Documentation/process: Add Researcher Guidelines
In-Reply-To: <ajACprp9UJp2JSJM@black.igk.intel.com>
References: <20220304181418.1692016-1-keescook@chromium.org>
 <ahgaOigklcDCYvRp@stanley.mountain> <ajACprp9UJp2JSJM@black.igk.intel.com>
Date: Mon, 15 Jun 2026 08:58:34 -0600
Message-ID: <875x3j3l5x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:error27@gmail.com,m:keescook@chromium.org,m:gregkh@linuxfoundation.org,m:zack@upsilon.cc,m:rostedt@goodmis.org,m:labbott@kernel.org,m:julia.lawall@inria.fr,m:wenwen@cs.uga.edu,m:gustavoars@kernel.org,m:linux@leemhuis.info,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92402-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[intel.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76B416876DC

Andy Shevchenko <andriy.shevchenko@intel.com> writes:

> On Thu, May 28, 2026 at 01:34:34PM +0300, Dan Carpenter wrote:
>> On Fri, Mar 04, 2022 at 10:14:18AM -0800, Kees Cook wrote:
>
> ...
>
>> > +  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=y using GCC
>> > +  11.2 show no new warnings, and LeakMagic no longer warns about this
>> > +  code path. As we don't have a FooBar device to test with, no runtime
>> > +  testing was able to be performed.
>> 
>> People have started sending commit messages in this exact template and
>> normally I would ask them resend with the meta commentary from this
>> paragraph below the --- cut off line.
>> 
>> Do we really want this "Compile tested only" stuff in the permanent git
>> log?
>
> +1 here, can we rather avoid flooding commit messages with the meta, that
> anyways is available in lore.kernel.org archives?

Perhaps somebody should send a patch correcting the wording to how they
think it should be...?

Thanks,

jon

