Return-Path: <linux-doc+bounces-83302-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB2eCC7I3WmwjAkAu9opvQ
	(envelope-from <linux-doc+bounces-83302-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 06:53:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA823F589D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 06:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2E253017789
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 04:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4D9282F1B;
	Tue, 14 Apr 2026 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDrjrILD"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B623FC41;
	Tue, 14 Apr 2026 04:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142378; cv=none; b=jXYAmw7lkejTnOVu1VKGJ91EiL/8mL5gyJIs0hX2HHvMUKb2o5YDwFxEirFQ1Ms5WMRVxIWDh0p2UBdXYFyyk3Id8Ajhpn9PuxTCMQXY1tOTcW4FlzxEXwMiJRAUAXSwmStA9Bvx+prbOsYGzpQQxKDVumzLxrwpjOCBVrR0knM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142378; c=relaxed/simple;
	bh=XFDfAH8hl/rMT3opER9N2QufMR6JcD32h69OYGzgzeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AiwwU/xuvzOfYUOb5XaW6J9xQjrpmbaqrzaFpUAHwe3FZUe5Vnoxp4R7fUJSs5DMxx2RdcB1mV22917gkgbOW1umDHbX0tkUnUacf0UIWJY7Svao8Fw9lJmq/rbX1Vn5xRz5ydlw4Nj9aLxZKIkKuCK0HPbdSe917R4I35gBXvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDrjrILD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07293C19425;
	Tue, 14 Apr 2026 04:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776142378;
	bh=XFDfAH8hl/rMT3opER9N2QufMR6JcD32h69OYGzgzeM=;
	h=From:To:Cc:Subject:Date:From;
	b=nDrjrILDP4rHksPC6RwjPAn524ADLrsUsXjqEaGTIk8pf2gBW9l3fl2pacUs7maby
	 4pvYqbVKpnRPbKhNESPPkDoPFxW4hnQeHEVh4/vr3+SInAjjBVC1NGJWkCMcAB/AAA
	 1rVKNQEY3iA46yIx+gAVVsziQHgT31aZekIhyoX3HfvsQ8g2jjpIOVP159Rs8T6Zsl
	 xWZvDbiPZPb+eknG9T3wplPTnoZRp/G5WlQsPuZvU+v3dj/YwXwuOPPvpySMlPbN+Z
	 SiE26TNCgfZm4RtjvRz0XxF5JjwB2IhwWdmvtwLJbgA/MvAjSH66JvQOOq/3dnhhyF
	 oiVJNVZ+L38uw==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [RFC PATCH 0/2] mm/damon/reclaim: support monitoring intervals auto-tuning
Date: Mon, 13 Apr 2026 21:52:49 -0700
Message-ID: <20260414045253.88529-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
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
	TAGGED_FROM(0.00)[bounces-83302-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AA823F589D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The monitoring intervals auto-tuning feature of DAMON has proven to be
useful in multiple environments.  Add a new DAMON_RECLAIM parameter for
supporting the feature, and update the document for the new parameter.

SeongJae Park (2):
  mm/damon/reclaim: add autotune_monitoring_intervals parameter
  Docs/admin-guide/mm/damon/reclaim: update for
    autotune_monitoring_intervals

 .../admin-guide/mm/damon/reclaim.rst          | 11 +++++++
 mm/damon/reclaim.c                            | 33 ++++++++++++++++---
 2 files changed, 39 insertions(+), 5 deletions(-)


base-commit: 02f9b1619307bbcf7028704a50f6b31909f360ce
-- 
2.47.3

