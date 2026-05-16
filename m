Return-Path: <linux-doc+bounces-87913-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b43DB+TpCGpD/QMAu9opvQ
	(envelope-from <linux-doc+bounces-87913-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 00:04:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F6C55E05E
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 00:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F7E3013B5A
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 22:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B412E374186;
	Sat, 16 May 2026 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXDo6/EH"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC7405C48;
	Sat, 16 May 2026 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778969054; cv=none; b=KRmGNmdufCRY4Vr6GzfFtItyaiW/ldYdCQNBMV6vlFV5fQjDwaTITwfXUCb5iey174K2M1XFvhMgO5KY3hED9BiTSV7MEYDIf+nv2Ncp+i7nx6MrH/pG6vI/SlRXiyXEHi7OCLL+bH+tzwo8Lo7W90g6sZFD2Rn0hEiT2lFWaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778969054; c=relaxed/simple;
	bh=jqUJDOVFPnUp4elyBS4bsFweoUttqEpYWejG0EQ9Hc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBvVwmFe77HS8Ep2/ajjwPQ9lbmCznu/UbbGyC3uoiFrPCO4KlNuq1J4NEu8dxPwEbnYRDA1OLS8jhUqMCZW/5cUVXAWGQwiU7gvqJlZ3SLuH5kqAJmWrBS2UNuomFq+hVWtVkllJRSTSZ6mw/VaV+Ufk2TpaXXDMZPK6DbUcZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXDo6/EH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B7FC19425;
	Sat, 16 May 2026 22:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778969054;
	bh=jqUJDOVFPnUp4elyBS4bsFweoUttqEpYWejG0EQ9Hc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aXDo6/EHMP7g5zKEG7iKB4Qxz3Lrf3sdPP5zBHOr7Y3UUAL8c43gxrU6tilYE41jC
	 PGIS05HaNt1c1lq39JLyLx7tr1fsaS4GxvX28m0svfsyH9NkRtxbHqZnAN8y5Ve3t1
	 HlD0mwOVEvoKTnYOYUqnHiTCC+xpylEd3rKQU7sdj576eo3TbikY88DaTTWQBv5MdH
	 oO6dwlxNN9jdO0fV8UGwzCWG9H++dAOoL5njpZ+OE6h0xY4GsC2lsx+bEuFrG4EGnu
	 TbM/kd4xFvBR4mbObgv9kexhyiyLNK9QLPvIdM+TO/4qNFO+ScKXoKfXEPvyKzpDpH
	 o7jpPzwCY6BKA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 00/28] mm/damon: introduce data attributes monitoring
Date: Sat, 16 May 2026 15:03:16 -0700
Message-ID: <20260516220317.4300-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260516183712.81393-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 88F6C55E05E
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
	TAGGED_FROM(0.00)[bounces-87913-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 16 May 2026 11:36:41 -0700 SeongJae Park <sj@kernel.org> wrote:

> TL; DR
> ======
> 
> Extend DAMON for monitoring general data attributes other than accesses.
> The short term motivation is lightweight page type (e.g., belonging
> cgroup) aware monitoring.  In long term, this will help extending DAMON
> for multiple access events capture primitives (e.g., page faults and
> PMU) and eventually pivotting DAMON to a "Data Attributes Monitoring and
> Operations eNgine" in long term.

Sashiko found [1] no blocker for this version but a nice document wordsmithing
idea.  Unless I get other opinions, I will drop RFC tag from the next version
of this series.

[1] https://lore.kernel.org/damon/20260516185032.82261-1-sj@kernel.org/


Thanks,
SJ

[...]

