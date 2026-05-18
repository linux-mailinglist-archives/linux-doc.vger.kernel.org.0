Return-Path: <linux-doc+bounces-88081-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DxhGQJeCmqq0QQAu9opvQ
	(envelope-from <linux-doc+bounces-88081-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 02:32:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B67564845
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 02:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C8E83001A5B
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 00:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555C212F585;
	Mon, 18 May 2026 00:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6hoLyFo"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30167C2EA;
	Mon, 18 May 2026 00:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779064314; cv=none; b=jR6on/hjkkzP4tjdjCpep3gRj3wdqNhgtbihKixVlb3RLG4qfasSSO9eVDEXdv3d25sZXwAXnwgzn/mK/H3f7e05xsBIXkR9tcvIMRyRRdE/dbuBy/m13/QG3upQ/Np/FTQpUDqLh+h35IBTPds1aYHQF1fhploEvyRD7PFW/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779064314; c=relaxed/simple;
	bh=P0yfwFwGdfVQUZWZRsLbZpRmNi1AbMAXOb5ZQy0ErQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyuSYWziYR3DQcMW4wg84wD8p8YRTFeFdOMnNBCFUee1UlQzYgPeMWcXkMXTivv4yQokqzO8Q9kV+TrnCS+/ZW42dkDTQ/s5uY1FQj6kqSu76Tj4RpFFv9TBmauVtQ0ATwpzvGPsf/RmRKcboONwTnw6QKTNZBEMBigrlMvImOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6hoLyFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C1CC2BCB0;
	Mon, 18 May 2026 00:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779064313;
	bh=P0yfwFwGdfVQUZWZRsLbZpRmNi1AbMAXOb5ZQy0ErQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6hoLyFoUX9K5umBVNVOeUFCrRX5nD5Ovcu+0K9kqwypBypQnr1JVq0SY4Bw84uL7
	 8Qfkrz9/BnbRzpAfM6l0KcXK0iryttGWEn2cwHSjDI+AFWncZnnpVgNWOehhFkl9kA
	 4JQjNknYKWjKIAqVWcNfuYAVfJ7jot1WFLUfSp1iRTKb87ZUj8us5fAfzhMrPBWNoG
	 PPzn0yLHJ5emhyhRH/Xj+aLDiRYDmuCsV8C8loz6LuUx77vR460QfcREN3E/JcHRx2
	 yJoWStHRx4iL2WbGB+jyFw6brGQJH50u+lo+JU32K7tud9SdX3/glJ9BUSpR6tG9aC
	 T559hc1/UhaEQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Zenghui Yu <zenghui.yu@linux.dev>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Docs/{ABI,admin-guide}/damon: fix various typoes
Date: Sun, 17 May 2026 17:31:41 -0700
Message-ID: <20260518003142.87871-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260517235214.89662-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28B67564845
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88081-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email]
X-Rspamd-Action: no action

On Sun, 17 May 2026 16:52:13 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Mon, 18 May 2026 02:26:22 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:
> 
> > ``damon_target_idx`` was wrongly written as ``target_idx`` in the docs. Fix
> > it all over the place, as well as the wrong directory count, grammar, etc.
> 
> Nice, thank you Zenghui!
> 
> > 
> > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> 
> Reviewed-by: SeongJae Park <sj@kernel.org>

Note for Andrew.  Seems this patch is not based on mm-new.  I added this patch
to damon/next [1] after resolving the conflict.  Please feel free to pick it
from there if you'd like to.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=011caa6d782382337b598a92aefe3c5db5ed8c0e


Thanks,
SJ

[...]

