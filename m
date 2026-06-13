Return-Path: <linux-doc+bounces-92248-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DqfBLOSgLGodUAQAu9opvQ
	(envelope-from <linux-doc+bounces-92248-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 02:14:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9F267D360
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 02:14:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="WT/RpASS";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92248-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92248-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5488532C9A34
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F03B67E;
	Sat, 13 Jun 2026 00:09:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1EE571;
	Sat, 13 Jun 2026 00:09:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781309341; cv=none; b=omug8iQ77DLYjV2+Ts5E7kSug6r1zYcUySM3wtczJOK9SORwIaF+2tAyiL3n5HUShbHEq2tqgTE9fEGo6oETrvQ9vZkFmLE5I2J4O6uzmGCBsNp2ncJ+p7w1WeDj/pymZ41Y0RJ0Af8JpLecEGgeOsxr3Lb4Rjyo8PTrGtxEoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781309341; c=relaxed/simple;
	bh=lUURjHSIiLgxi8zWPDFGVEmDdY3l4ohEKl1HNP31F5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKj8pJFrn5ng2Ws9aMkqB9UKJb/0owu9/ITgViH38vkFOT8a1JY9izcXsgWzhEtPWLIHnj59G5YM6KO0JfBGAgL8Kd6RIv0Q7BRD74AvU8due6AM1fPU7JhN/Qg4hucP3fm/Eu4Z+YvaOJh7lHYFbEQS7OZQOdTaYDB1oY2mit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WT/RpASS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8ABC1F000E9;
	Sat, 13 Jun 2026 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781309340;
	bh=jwgdDxjpHcf51uQFCyHB9zZ8TZlVfxL9kvGTnnuc2og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WT/RpASSQHJBF/FCpzT7VvJcI/8vJCsTJVgtWdnX/u6SnGSXgt+9VBbPNygOHOuM3
	 Xi5O97z8PSzS9rDITHCy/37Y0tPkWdYCaBgFOyfL8G0LHF26aTZ9m1nvmmgMCb4aUo
	 4qxIbE4eYeEf9BA4rGrHfN1iz9LdP3D76YDWfmjYZsg9HyuXx1AMJtdwUnYfvyOgsn
	 85GMHHWMt7zp8woZNLRcNrCwyD7bu4TpaKoJWLRiWEDY8A9xBixHpRlwbClICFyzJ0
	 G2JLUEcyClWT3DaxJHlngGsOD25ag4WYye+S1Eu+2p/9OMU+NDO3xfOBUS97aMINZV
	 BJJS2sdZA/EqQ==
From: SeongJae Park <sj@kernel.org>
To: Shardul Deshpande <iamsharduld@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/mm/damon/design: fix a typo in the Address Unit section
Date: Fri, 12 Jun 2026 17:08:50 -0700
Message-ID: <20260613000850.935-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612154054.720363-1-iamsharduld@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:iamsharduld@gmail.com,m:sj@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92248-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E9F267D360

On Fri, 12 Jun 2026 21:10:54 +0530 Shardul Deshpande <iamsharduld@gmail.com> wrote:

> The "Address Unit" section misspelled the C type that the DAMON core
> layer uses for monitoring target address ranges.  Correct it to read
> "unsigned long".

Thank you!  I found you sent another patch having this change following
Andrew's comment.  So I reviewed there.

[1] https://lore.kernel.org/20260613000715.791-1-sj@kernel.org


Thanks,
SJ

[...]

