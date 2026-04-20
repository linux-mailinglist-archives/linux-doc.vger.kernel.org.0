Return-Path: <linux-doc+bounces-83908-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JMTLr665mnX0AEAu9opvQ
	(envelope-from <linux-doc+bounces-83908-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 01:46:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DF434F0F
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 01:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E07A8300617F
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 23:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56AC3314AE;
	Mon, 20 Apr 2026 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDnt4ExQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B642309AA;
	Mon, 20 Apr 2026 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728763; cv=none; b=WSion1bnfLLoDVpbGlvpsp/J/CsTD/K6Fqwr6Oq/y3camYIbc58y6WxNnNIQ1P+YkJHjYkya7yQ5Ng8MecZOt3E0eolRot6lQH5tnn4J7Gijb+1vzpYZUg22qx3/Q8txUMjLNJ697wbMmS/CSVdq7vFL9E4EEdv1mdp//bvkgxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728763; c=relaxed/simple;
	bh=QcHKNAPKMgZJbCP4QyTrKg7c61pwrQPCwenA+42Ta6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cm4sDBFteOVnGgf8Zb3FSoh/68BP4Y9uE342/EirUCOIIBU+vegOTRP+rQe7jHv2wqIQ6NFeWsE3UxQA47ytU+SOHUzS9EqH1+Px/UV+jDlS0mH61hu3hO5K6sdLAjHruPRxVrIREE9ZA9L7sDHi5scx15O0OfyoCIhk2XGYAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDnt4ExQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2ACC19425;
	Mon, 20 Apr 2026 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776728763;
	bh=QcHKNAPKMgZJbCP4QyTrKg7c61pwrQPCwenA+42Ta6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDnt4ExQQOZS+94twVkPx7zfcYRrYwsWg4Vo4iE5sCT7orDhUZAeNaPHqG6rMAt8e
	 uYnak1ro/G45k/b+8oXoXbqgniVeWWFieWtwPOgzLaMxKSzCmaQY941OL7NmqJcIW6
	 NV+J7efXb0/C/IFIKVuvA8Ky70BwtzKOMtUKnru9iYCVlsDOqk0HwqfLL03QB4N57m
	 arRM12346V2H2PzjuE9P/46dbFVud87C3TDjWwcxQTeCUtz0RzB7qttKRuqpvN2q9s
	 4LbiDCRU5mZAA9YE7n492/UWO9ZK3b9fHtZ8GyPJisFPHlbicNmufaKki7cYojgfGa
	 oLUi0CvLcMwdA==
From: SeongJae Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM generated content
Date: Mon, 20 Apr 2026 16:45:53 -0700
Message-ID: <20260420234554.66290-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83908-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3D1DF434F0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 23:03:16 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> Let's make it clear that we are not looking for LLM generated content
> from contributors not familiar with the details of MM, as it shifts the
> real work onto reviewers.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

