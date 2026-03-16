Return-Path: <linux-doc+bounces-79491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ikRsIYsauGlYZAEAu9opvQ
	(envelope-from <linux-doc+bounces-79491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 15:58:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6D29BE1B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 15:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E06530AA14B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52262EB860;
	Mon, 16 Mar 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erPcNdRr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8074F2EA16A;
	Mon, 16 Mar 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672589; cv=none; b=SnUqX6CN80DzPu4JdFYLeFIn5fnTYpx8tIq5mh8NXjboP7PSUIBUhAi168xoQDto56hCjUgqXJ5NArRzzorJpHlzp5xdt/4RqGt0nREpRf9XG0irD9Ng0U5XSIcwXpbJGH/C30KW/4bmQQeOgZ2BCdIdjNnOjC90+j50Iv5e7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672589; c=relaxed/simple;
	bh=FNxLuIsdj1rcfvCD3t5aqHNbmMs+iUHxFAnqDU2yMVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6+5MRvxJECqILGIwr68g7IzroOMGJYsxxYJtrqyUOZSQsLR/T3xDHYjyXR/qVkJMVx7DngTQUOqcNHHGJAjC4NK+9N63jjM3t8wqfb26QDzLcX+DU9x/l2ZWxOKsjNCcubzegXLhAz8R7kXay/smOMrtcJHfn4eoYfaMmcZoLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erPcNdRr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4208C19425;
	Mon, 16 Mar 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672589;
	bh=FNxLuIsdj1rcfvCD3t5aqHNbmMs+iUHxFAnqDU2yMVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=erPcNdRrzSzoBmpTVlu95ZNbsecE8P2qaKZt/azsVJzsJxdGOqSRiA+tXJr3zz8s5
	 TjN08ppq3ADBs1No4j0+PIc614vCK6BijXfQG0ZKphb+tC07jT+ViD4DWkunCDezDP
	 3URvTNSbxypqqE2HeOA8iNGODdBIDKxg3rr53u4OwKoBbI9lP0rcMQu7tIJbXKhTha
	 M1pdgES13ae3uWawJukxsAuv3PtSvVxSu0LUnPU8R85f8rN5lLkjaKUC6+nLWnLSnj
	 3/PfNA0uhKHoZcXb9h6v1h9g01QRPnbj0JHYokHNEdnD7Dyndh4Rc9UenF8BBLfnj8
	 yRS+PDsbp6GwA==
From: SeongJae Park <sj@kernel.org>
To: gutierrez.asier@huawei-partners.com
Cc: SeongJae Park <sj@kernel.org>,
	artem.kuzin@huawei.com,
	stepanov.anatoly@huawei.com,
	wangkefeng.wang@huawei.com,
	yanquanmin1@huawei.com,
	zuoze1@huawei.com,
	damon@lists.linux.dev,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] Docs/mm/damon: Document DAMON actions when TRANSPARENT_HUGEPAGE is off
Date: Mon, 16 Mar 2026 07:48:47 -0700
Message-ID: <20260316144848.99972-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316140822.2033181-1-gutierrez.asier@huawei-partners.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79491-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,huawei-partners.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6C6D29BE1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Asier,


Thank you for sending this patch. :)

On Mon, 16 Mar 2026 14:08:21 +0000 <gutierrez.asier@huawei-partners.com> wrote:

> From: Asier Gutierrez <gutierrez.asier@huawei-partners.com>
> 
> MADV_HUGEPAGE and MADV_NOHUGEPAGE are guarded and they
> are not available when compiling the kernel without TRANSPARENT_HUGEPAGE
> option. The DAMON behaviour is to silently fail[1] in when DAMOS_HUGEPAGE or

checkpatch.pl shows a warning for the above line:

    WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
    #12:
    option. The DAMON behaviour is to silently fail[1] in when DAMOS_HUGEPAGE or

> DAMOS_NOHUGEPAGE are used, but TRANSPARENT_HUGEPAGE is disabled. Update the
> DAMON documentation to reflect this behaviour.
> 
> [1]: https://lore.kernel.org/damon/66131775-180b-4b9f-b7ce-61a3e077b6e6@huawei-partners.com/T/#m278d3c9bbedcceaf2efa51e3dc7b40a40654e51c
> 
> Signed-off-by: Asier Gutierrez <gutierrez.asier@huawei-partners.com>

Reviewed-by: SeongJae Park <sj@kernel.org>

Andrew might add this to mm.git while fixing the checkpatch warning on his own.
Let's give time for Andrew today.

I also added this to damon/next tree after fixing the warning.  If Andrew
doesn't pick this with the fix today, I will post mine as v2 of this patch
tomorrow.  If you prefer to do the v2 posting on your own, just let me know :)


Thanks,
SJ

[...]

