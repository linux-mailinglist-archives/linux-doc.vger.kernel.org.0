Return-Path: <linux-doc+bounces-94092-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cG19CowIQ2opNgoAu9opvQ
	(envelope-from <linux-doc+bounces-94092-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 02:06:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F10E6DF520
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 02:06:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=op2Qz5sb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94092-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94092-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E37DB302F42D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 00:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311951FC8;
	Tue, 30 Jun 2026 00:06:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226FE8462;
	Tue, 30 Jun 2026 00:06:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782777991; cv=none; b=cIblhBuFkhhu/fN2KvrfXBv15cdDIsMsTKCjlJkrrR0nLP+M4a7QzOYh+d1yJO40H2udQ2IwmGlipP1GFq21kvT98nm5U5Jq+zu4PDEjTr9ZrSoYi6KcTzc3js3kr1bmCWQsmB31AnodjPT20VTjo7mCz/XTMLgunTeRuIcdLVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782777991; c=relaxed/simple;
	bh=Hb+5u2O0NYDZMN2nffXTZRsmC0oPWxRQB3QuCRK+RAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3SVPIFRrgxNFqAgbxj5joM5FKMsWuU8YgAY7AsemP1Vgcs1nuQ/D5WLgEfT8T+7WiVqg12MuAykxl+7Vb+xVZUl2SII4KwOyFUc+12oc/xvRE7viZf+VFJ9VqdX0fhpphjrUL5L4tWA+lvckbDphGH9WphDdDlKFk4e3vsyoVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op2Qz5sb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C9B1F000E9;
	Tue, 30 Jun 2026 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782777989;
	bh=wr0WhPYUR8JNxrzJzf7gHN9+IIk9NqnlvxkjdbY2WYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=op2Qz5sbAMoEgRjtESmf7VxN/alp731dgehGyYqOvxX+SYlu1zrmDu2m/ooESPLri
	 COenaZehUI35c1792BoWfzxnx+LUfL6xhUwhOVcysVA/mUB8lKUpU1cAvNI3p+To+o
	 VhO7dgNpFBGNfZ//6nYSXVqIPT9hRxSUUr8jPbc4gSnix35irf08d8ABfrEv9m83CM
	 qYv76/ZbvUb2FUqINLXl1RKUlnGeqeCkQUBTYcBIRNT7R0umdybdRfZl1VxAp7Q5PP
	 lYf/uoR0R0EMGcWFFQi7qg7AZFsB07Q+eElv7l5wnaiIzLqQE//rYuZmmX5nkQa7b2
	 MrakI1V26OeMQ==
From: SJ Park <sj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: SJ Park <sj@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm: Fix braces
Date: Mon, 29 Jun 2026 17:06:19 -0700
Message-ID: <20260630000620.138992-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629161156.90213-2-manuelebner@mailbox.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94092-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:sj@kernel.org,m:jgg@ziepe.ca,m:leon@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shakeel.butt@linux.dev,m:rdunlap@infradead.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F10E6DF520

On Mon, 29 Jun 2026 18:11:56 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:

> Correct typos in mm documentation by balancing parentheses.

Good eyes!

> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

