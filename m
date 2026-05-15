Return-Path: <linux-doc+bounces-87568-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KskLd57BmqskAIAu9opvQ
	(envelope-from <linux-doc+bounces-87568-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 03:50:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7355488D5
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 03:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53AB73008A74
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 01:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797CB2D838E;
	Fri, 15 May 2026 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsLbToBR"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545062C21F1
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778809790; cv=none; b=M68tbporbt/D3FvCaO3XH6dRH+xm6zF9xJLWVdWJX3nqWo0rZ9rNST2Xg2tksF7dd8UKM4BN/slOpq9GAjwSbrwkyEAhxZJUm4s9sCEOnpBaQj5DgvI3q2AYXBB2D7VKEsGr2F597jS9fq8uO8QLZmWpF4+af7uSdMoVKmRsrlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778809790; c=relaxed/simple;
	bh=aq8Y4HDWvTzLSxNL1nzXPObwRzU19vm35otQrWKzGwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AUacPF+qZaD6uQ0BAkAtittfABm/fm4TOA4Lv4/fgtPtReorE09gIQS3B56aW1wU8dZWXOv+Ihm7soD6yENZ3H1EndQw6u+p1BF1Xt5VG3+GglpBMJbl4V8d2STU6kwbNCjmBI+QP22oukIMO25ATzG6YubV7olxFegqetBIYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsLbToBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C914EC2BCB3;
	Fri, 15 May 2026 01:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778809789;
	bh=aq8Y4HDWvTzLSxNL1nzXPObwRzU19vm35otQrWKzGwM=;
	h=Date:From:To:Cc:Subject:From;
	b=YsLbToBRP5lMzV0z9OXJHbczpCO7LjZZvY7gjv+n+BNd1ip7EhsoqxKXfqWUXYEQY
	 5aBI1YIdZfjPwaMdovGRY3NhA9u0qpuYc9bo1bSMiJeBOnUGNtMa+xGzCTD1QvfivT
	 adG/Fobm+W/mUdG0WPiZReEjjvoJfgYGe5jmqFg6la8riRFQGTWYbScVVkpptdhz3f
	 8eW9MkmrmqF8eecZ5JxgtnTnaOsnOFtnJgTl2a9C7dv4OsaLd8w0htD2c5YZLdLpRC
	 GanhcCTgEGNIbI/O4/1/igsv8pSBQPI0avUh5FBJ48j0q8HNIJRXw5yUHe+S3ORV5+
	 pSN19JfFlbEpg==
Date: Thu, 14 May 2026 18:49:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org
Subject: kernel-doc no longer warns about leftover argument doc?
Message-ID: <20260514184948.3fa705e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1E7355488D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87568-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi!

Looks like the new python kernel-doc does not warn when there are
stray arguments in function kdoc. Eg

/**                                                                             
 * ksz_wol_pre_shutdown - Prepares the switch device for shutdown while         
 *                        considering Wake-on-LAN (WoL) settings.               
 * @dev: The switch device structure.                                           
 * @wol_enabled: Pointer to a boolean which will be set to true if WoL is       
 *               enabled on any port.                                           
 *                                                                              
 * This function prepares the switch device for a safe shutdown while taking    
 * into account the Wake-on-LAN (WoL) settings on the user ports. It updates    
 * the wol_enabled flag accordingly to reflect whether WoL is active on any     
 * port.                                                                        
 */                                                                             
static void ksz_wol_pre_shutdown(struct ksz_device *dev)


AIs seem to catch it but that's not ideal..

