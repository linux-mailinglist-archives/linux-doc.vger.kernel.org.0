Return-Path: <linux-doc+bounces-84851-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEbLAbrz72nYMgEAu9opvQ
	(envelope-from <linux-doc+bounces-84851-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 01:39:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6047BE5B
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 01:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89F730315F7
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 23:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C973B6BEE;
	Mon, 27 Apr 2026 23:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJAG5TPP"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3B3B19B1;
	Mon, 27 Apr 2026 23:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777333172; cv=none; b=Z5MKyjrSmAsfbDoadqiAbB/22/sbfNr0Z2AnkgmoPENEa7nlc8OYJITigHIJ900Mlp7wZDWG31Z+6VmDSk/s440YH/QhUImrIQ/lUvw1WjmmwaZMtYGoTMweJSEZ/cSD8sEPumQTR7e/l41OJi/kaeS/b+PPBJBOlKF/NhP5MoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777333172; c=relaxed/simple;
	bh=Zl4RMPcd3Mruw3bjUpCvED7vUUWsDSlxRDKdrEHiNik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kI99SR2iTTmxGnFDPlz8f3FwG8lelt3GDV0MRR7gFpFV+IFdPL9UnaPFzIBPu3pKQ1I0edA6qc1BlYg5U7JkLMGc+L7Q463WXen8r6dmZwGKNEAhqJ5Z4F0trNHFMRn0AiWlMItiaSqZg8d0arjJscc6tq0/5AarhlD91FFlVPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJAG5TPP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA48C19425;
	Mon, 27 Apr 2026 23:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777333171;
	bh=Zl4RMPcd3Mruw3bjUpCvED7vUUWsDSlxRDKdrEHiNik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJAG5TPPkL4hNzaTsW+UlTD8dKhYf3YmFzUu3qYI4XfO6Eeb8u8f/9kam+xhjK4Gz
	 vwiZCBPy6dl/PL6NWYOnuMiHITcEJbJJA43QQscznMkdnL6P3D4eUDZaBl44Bj3D3/
	 khW/QfN9fKl455dtdmlROmX3g31VfX3+qo5H+n45e9QQEWK2tQM2XDeq0SUqUseMLq
	 io7ErQmwA2i/4QuFPcg6yJ3qyMxXTrDcnea/CNUb8bFN7IwQQuE5xW/o2qZq1ciE2G
	 x2CByJhldavvm69nIoAITyXdcYCeqhzAFQPXQ/3u1Dd+lRO6s75RUTr8yDAOW+xF2L
	 /eO/b4s2JFfPA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Cheng-Han Wu <hank20010209@gmail.com>,
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
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/4] Docs/admin-guide/mm/damon: fix 'parametrs' typo
Date: Mon, 27 Apr 2026 16:39:27 -0700
Message-ID: <20260427233927.146488-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426231619.107231-3-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 58A6047BE5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-84851-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,infradead.org,kernel.org,lwn.net,suse.com,linuxfoundation.org,google.com,lists.linux.dev,vger.kernel.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun, 26 Apr 2026 16:16:15 -0700 SeongJae Park <sj@kernel.org> wrote:

> From: Cheng-Han Wu <hank20010209@gmail.com>
> 
> Fix the misspelling of "parametrs" as "parameters" in
> reclaim.rst and lru_sort.rst.
> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>

Oops, I forgot adding my Reviewed-by: tag.

Reviewed-by: SeongJae Park <sj@kernel.org>

Andrew, could you please add the above my Reviewed-by: tag?


Thanks,
SJ

[...]

