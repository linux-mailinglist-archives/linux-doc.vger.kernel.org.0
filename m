Return-Path: <linux-doc+bounces-84852-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIbKIiL072nYMgEAu9opvQ
	(envelope-from <linux-doc+bounces-84852-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 01:41:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 188F747BE9A
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 01:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AD7E300D637
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0C03B2FE3;
	Mon, 27 Apr 2026 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzjLCjcU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D6A26C38C;
	Mon, 27 Apr 2026 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777333278; cv=none; b=lfp1wZb33MsR3cL/hh7/XD8DehfIDQBrG+cymAUpw0FnE/NAiYjWoZvySEWjYBMoF3GfcRYBZLBUX3ULHlkQRoVoZ0Ta4dApeE8l1++0nDTo8bZQJXO/ghinDPvf9wIUY55wKBmh8sTX3iKBySWbbmXTL6mX4MouJtkWGlO+TDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777333278; c=relaxed/simple;
	bh=j3eKjY8PPbVBXWxEaIlKvaUtDpsq77HAbJa5qEyE5Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTxCwEM/PLImcJueh7Sjq2gnZYhKpqdnJMaY1Fr7JdnQdcqZ+P0upzYj/tjpJvXNbQcj03jF3Xz3d0a4K6uG74aigLXa1dG4R0kDJgibr29AjxthRMrE04GmtwESAaxbbojUvuhXDScoHd520MQFBcVa+Bq02QZclGFsOv9SuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzjLCjcU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF35C19425;
	Mon, 27 Apr 2026 23:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777333277;
	bh=j3eKjY8PPbVBXWxEaIlKvaUtDpsq77HAbJa5qEyE5Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzjLCjcURhfZe0BV5T9KU2DvNDTKg4XYXnNshRfqh3jFPqC1uRK8HQJezCNJd/Ifp
	 pxHQP0JaSRLm5pHQ4PfZwpY0UpRtZ3u9aVpPl/Y/WHeLyUl9I2BnVt3uSqRpiSAeif
	 pkZxeVJrhlgdAVklYA2LB3BhTEOTxuKDmupQDJ5xJFVgoHDVaTKSZSH2XVWIUMRitm
	 QwhW7yo+BcSmYQDntRDqaV9cZNS/8xkNqY6DfWemilTxfp1PPRZ+CdCoSVsajbxz9n
	 BTMjc0VJ6a5TB/fMD+dhd/a9ZkTaUDWlLXRAt2cfR8sjvx1eAcVzzI4Sigy908E9EW
	 i9kTXupYN/kEQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Asier Gutierrez <gutierrez.asier@huawei-partners.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 4/4] mm/damon: support MADV_COLLAPSE via DAMOS_COLLAPSE scheme action
Date: Mon, 27 Apr 2026 16:41:14 -0700
Message-ID: <20260427234115.154563-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426231619.107231-5-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 188F747BE9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84852-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei-partners.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sun, 26 Apr 2026 16:16:17 -0700 SeongJae Park <sj@kernel.org> wrote:

> From: Asier Gutierrez <gutierrez.asier@huawei-partners.com>
> 
> This patch set introces a new action:  DAMOS_COLLAPSE.
[...]
> 
> Signed-off-by: Asier Gutierrez <gutierrez.asier@huawei-partners.com>

I forgot adding my Reviewed-by: tag here.

Reviewed-by: SeongJae Park <sj@kernel.org>

Andrew, could you please add the above Reviewed-by: for me?


Thanks,
SJ

[...]

