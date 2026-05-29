Return-Path: <linux-doc+bounces-90080-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBW8JNXuGWoW0AgAu9opvQ
	(envelope-from <linux-doc+bounces-90080-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 21:53:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE907608147
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 21:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D16BC302E92F
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 19:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4AC3DDDD0;
	Fri, 29 May 2026 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quPQI1n6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4333769EB
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084305; cv=pass; b=vFBJabR71b577WDakncCKY8qmEH3rSA+28OjZif60p3V5l+yplscMgFWxpv9YSvxZMOjl3Hh7smYSc3b/wOl1V5lx0mkovZTLJ0S9FNr2B9hDgsrz48MdhiAAQIGhqqWDRz9ZJarOxxcelcwDjzHuzFXvWqebXazlVAGX93zAOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084305; c=relaxed/simple;
	bh=vnofybMfKXc73Z7GzMMBieo9YudKdcjIw1E1DXfQBmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uA3/0ugNZlSM690j93giPyMg8d5POvmQaZI77z8f4S2Az/uMbu6/zMi4CPVf1R6s31geH7T4kkU4YTTV7JMf/+Dq1/IY5KhZCrOeSjsb4udOO1VaZIgeQKlWpKlKlxbpdnDoUEP0XUqxYKPmz6/VS4wv3hnOxLAawJxygcAghtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quPQI1n6; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso124186125e9.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 12:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780084302; cv=none;
        d=google.com; s=arc-20240605;
        b=lq+whlyOKCLhQS5IZ5cewLYoLmjolih2R1ZybBdD1K2K4vXviJCfKNB1WkPGMe8kkY
         llSFrsZvLsni0oW+iPk5G88wdMSiE2wkF+oKTwMVRkCqhvaXOhssni6MEkS7xg7aPMAT
         OtTDzM0ebr3iYwp0W+ZVxdpGVOwhjk5GzWXIG4QwUrjX+xB3/3hh7bST4U6oIwtqWcu+
         zvhzv/E9guP1pm6cpvVs5QDcEQBNyK5UENIwNh00vWXWde21UdZfEEukCCymBd9xk6HU
         StAsqYMgZR9Ud/EtohCv8Pb57lD6ehOe3xm6ynZiNB930zjnqN4OOIwfCJPv90bVNysq
         x9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vnofybMfKXc73Z7GzMMBieo9YudKdcjIw1E1DXfQBmE=;
        fh=17kKpx1/xdTL2YKbfItWRVsWmszqkAxeQXD9lbmFTro=;
        b=LKxm412a+4VPjMuAmK1N8Wp0Mesovo691K1SLlqlf3TDlQgP92NPMFJ2o27juuEMFz
         kOK5F9eLIGdd7GGw//iJ80zVu8LGoVEdz9ZC/lqsWAfNJLl8yLRgP9pYvxmQbT6ZVYyo
         aK0wJY51bQqhgdslJzArED4yr11LiX1BE6nM1nJtXUmnXsMiUQ3js0S/GV7H+i9Xn8w9
         nvSYyHj2Wxp+J5+tzi66ukIySa6Rdbx71OEurc1CGumlETHXeZGTSzH3nomwLG58sh7C
         Oz+oyhBRlbdOjYMVJoDQB/CEqaUNhiDEXKg43ZseJjO4ZcKZLVLFEfxsjtz7McUih9rQ
         D4HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780084302; x=1780689102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnofybMfKXc73Z7GzMMBieo9YudKdcjIw1E1DXfQBmE=;
        b=quPQI1n6nf5w0xxhvY6xcCmtxjYGWazoulzG9Cr2fiz8HEjNhnIULebkI5qVUtQ01P
         txjZ6v9bkodVFhERU3EAqGmtsCEJFMJP1cX5CQLP2AFJtXMlLxAZGtsxK8U99e/Ug7Aa
         0kDbzYHbqD4UaznA6Kb4/Q5jqxsZXpBA0cVJ0W3HvJMAqgSuebQRowKXWi/EB3lwvF78
         YkeMJm/z5GRLp2kgs3pddKIPHieItj+nDRnRV9e/MdAqE8FKAvBMcJGOpBevzoLQeWK4
         5BATYU527+6x/yHtKk+GAsO7Rgs/DIpZNfjUOe9chxLHtKgFwvlFI7nf8DRlMjtexot6
         FAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780084302; x=1780689102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vnofybMfKXc73Z7GzMMBieo9YudKdcjIw1E1DXfQBmE=;
        b=DJX+LtiSF27HFy4qhJUjgEEFcFP2hQ7o9lMy/Jd5jxE+qBPj5NE/BE1cOb72zQkIcF
         U7aqWFGnl5m+9vaV8hK2FVLdhsjX57+8BKe3q7WBwIBqpJjDc3D0OUlnQiy9cBU4mL01
         WSy4o2OmtfXc54sHWQzEKmMch8KvWJeLbPlvBoLxCVPoElQP6QLIqy8ywXfkr0HGDDJ5
         3nLpIXgbJpN3bjY+T7OEQwCgG0XKEOWoZwqVjQgaeeNt2ER7EW7CagraGi7/vm5T+cy7
         WsFUVrlHTu3UAlpsdN1Caa0GGlQ9xYdPYsM/tjogqly0fJXtEmKxyma39t1K5eNKMPEB
         K7lw==
X-Forwarded-Encrypted: i=1; AFNElJ8nYowAucUYQBThf+itRVC27M0Vk6UYzZDhMiJ/R++vX2riLdjQlOTEWMA6a04p5Y7AEszEDLoAlYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdrSKxx6zf3o7XKOB9JVVYbgsUQXnHqvfpaRFacqm9orpNXGuJ
	AYhiCDGN/0GFaIkgB+b6/08qfYYLDuWGOLCqcRLJGTe/PJL02cSpHl82NaPUyf+VPL80xLEioOC
	/f1N+KUnhHso+TqDK11l7mB6odYhOffE=
X-Gm-Gg: Acq92OFm6IgjP7HohEBMkkBFxunsjdOTpw85itW47dz65dImskkGfyRr786YJswqqwS
	3Uly29S/MgfyP4tl312tH8z0CI/JRtbZ+OOQu9GbeNVdEYJinPcL/mYReWyLKljsEt+NwKODmRi
	usaWNh0QMx8RMRjnSNZqJQo5TnZjWUPVV+4XQZf7c5nEIrx4DHdvW3dibeTkM18+BreVCov+R/u
	Eaisf7pIot9GoIPRIodOKZAF9x0Ny+jo0ILlJFnOecvxEzjHo5hbQaUBTixpbJ6O01Wtvx1cBzI
	XIl5x6pQ4pSZ/iWx8seneQ74Qq4Ojkt2QHYdIKOZubaV9+zq37zNquqD0PSH
X-Received: by 2002:a05:600c:4f53:b0:490:3b8b:6ba2 with SMTP id
 5b1f17b1804b1-490a290bbc9mr18998515e9.8.1780084301582; Fri, 29 May 2026
 12:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com> <20260526114601.67041-2-jiahao.kernel@gmail.com>
In-Reply-To: <20260526114601.67041-2-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 29 May 2026 12:51:30 -0700
X-Gm-Features: AVHnY4L7tgvKRX4kdfRx8qsBxz-QbD35FXrun4oqca1DzRXBvrMnNdcuSN4_ihs
Message-ID: <CAKEwX=NrL_t2BiA7i9D-jUdzkTu-pJDy++0uvxrysetMc8aRUw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90080-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nphamcs@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lixiang.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE907608147
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 4:46=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> The zswap background writeback worker shrink_worker() uses a global
> cursor zswap_next_shrink, protected by zswap_shrink_lock, to round-robin
> across the online memcgs under root_mem_cgroup.
>
> Proactive writeback also wants a similar per-memcg cursor that is
> scoped to the specified memcg, so that repeated invocations against
> the same memcg make forward progress across its descendant memcgs
> instead of restarting from the first child memcg each time.
>
> Naturally, group the cursor and its protecting spinlock into a
> zswap_wb_iter struct, and make it a member of struct mem_cgroup to
> realize per-memcg cursor management. Accordingly, shrink_worker() now
> uses the lock and cursor in root_mem_cgroup->zswap_wb_iter.
>
> Because the cursor is now per-memcg, the offline cleanup must visit
> every ancestor that could be holding a reference to the dying memcg.
> Factor out __zswap_memcg_offline_cleanup() and walk from dead_memcg up
> to the root.
>
> No functional change intended for shrink_worker().

LGTM, if the memcg maintainers are happy with the overhead.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

