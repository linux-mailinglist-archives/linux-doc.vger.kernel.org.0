Return-Path: <linux-doc+bounces-87958-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCivLk2ACWoecwQAu9opvQ
	(envelope-from <linux-doc+bounces-87958-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 10:46:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC02560062
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 10:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEB66301325C
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 08:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D5D330307;
	Sun, 17 May 2026 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaCdPL4f"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B68287E;
	Sun, 17 May 2026 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779007535; cv=none; b=ZiPiYuyGReiAfucE+6xxb3uEvaeNQe5WPKJBvNYRI5LaVIv8s0cVRrQdO0hXwZuOS8PunxjzP7/Dm6m0CykavKIhB7YDjotcjmKFfJ/T4n0r40XOIm2aHkCJmRsEiKRAeOddeqPl6ESNWRerakpKAozDYrsMDDhU0UuBx63vXLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779007535; c=relaxed/simple;
	bh=LVzeahNDHZ1WvAmPSQ8GPJ8xKeGAguvAQRUr2DznCm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3CxnOEBAzHONvQGa3TFr07iI6nxaguBzu9Xs9XJtGfN/qTDmEwWQ4Xp/TItT7MNFS8HyDvVEtdcgLQm4ZXKAqQcbvVds/iLmpxKSjXaKnPE6hG6+Wf1MwopKtbBXIT7GPAvqqTUq5Oyx/ZcHsu8zw7aAiEY7XmQq1g35mDsJJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaCdPL4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EB8C2BCC9;
	Sun, 17 May 2026 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779007535;
	bh=LVzeahNDHZ1WvAmPSQ8GPJ8xKeGAguvAQRUr2DznCm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaCdPL4fOfAkwVPsyjkMALDCbw2efJ9jdDmWVk6urIWoAhsRIpVsbYQcYBxwmwZ1Z
	 ofKhSjKK7d2I6+NtrQxKNccw8MlYhKWdmtyW7vW+cpdKxWCV9YCI/dErQEiDSinBF+
	 cuSbEXZd6WkNvLuQkf5SkDUVzozx83ZSP73oOrmtjz2+jmi14cz8QU2/GP7h7v92Xz
	 hvyU/GXrUf1hpT6HHRAVY6Dvx1bgORLRJWJL+kQLWeeED/FvHWK94EZlWsQ784hZ+8
	 OM2rCDE4V8yPdYxugG36yJb8Xf3kvCdoeZ+zFErIMKyxvlc2hyWkPjpNA+RCvEjwPq
	 WO3HEVNTXABVQ==
Date: Sun, 17 May 2026 11:45:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sakurai Shun <ssh1326@icloud.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] design: fix typos in design.rst
Message-ID: <agmAJnMaRyyd-MEc@kernel.org>
References: <20260517073433.3015-1-ssh1326@icloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517073433.3015-1-ssh1326@icloud.com>
X-Rspamd-Queue-Id: 3DC02560062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87958-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[icloud.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icloud.com:email]
X-Rspamd-Action: no action

Hi,

On Sun, May 17, 2026 at 04:34:26PM +0900, Sakurai Shun wrote:
> Subject: [PATCH v2 RESEND] design: fix typos in design.rst

Please use more descriptive prefix next time, like SJ suggested
Docs/mm/damon/design

"design" is too vague and gives zero clues about what subsystem it is.

> L140: "unsinged" -> "unsigned"
> L371: "sampleing" -> "sampling"
> L387: "multipled" -> "multiplied"
> 
> Signed-off-by: Sakurai Shun <ssh1326@icloud.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  Documentation/mm/damon/design.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

-- 
Sincerely yours,
Mike.

