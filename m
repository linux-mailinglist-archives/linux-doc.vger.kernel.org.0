Return-Path: <linux-doc+bounces-7602-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E183DA51
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 13:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8DA92928D7
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 12:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E111B592;
	Fri, 26 Jan 2024 12:52:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx01.frank.fyi (mx01.frank.fyi [5.189.178.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518971B598
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.189.178.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706273563; cv=none; b=exHOZvAqTgEY56wsYQzOt84aLemE4g+QI1f8+R40NuAXdBbrNrZ9Fy0HpkoG/k5W3NIKPfAVmQ5OTb85jQMcdR20RtRHR2zgYTWD1S/5ZyZndq+P4NPqR8/QP4DwGTiWgX4e4yhSVfkTb52USX+GJeCM2O+ADzoOqmJ3fD0ko3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706273563; c=relaxed/simple;
	bh=TY3Ups8CevgW6c8x6FwJ65BmIHY7FeSXL9Q9A0pyiYY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyJCieAbyUCT1agAiippjEsLxbDy3SHSk3jHhsvQe4IFiKOyP+ScGn5d67LbvTsxiv37bLLXI3cyi5zf+XYBRo9daseELduqZDDP+Di6oHaerq9lzvA34nahmaXsPYFoms/Bor5qAnxUYcjOB2WJey5IZt/o2RWCXdIu5eqIL5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frank.fyi; spf=pass smtp.mailfrom=frank.fyi; arc=none smtp.client-ip=5.189.178.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frank.fyi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frank.fyi
Received: by mx01.frank.fyi (Postfix, from userid 1001)
	id 69F8D11202A0; Fri, 26 Jan 2024 13:52:38 +0100 (CET)
Date: Fri, 26 Jan 2024 12:52:38 +0000
From: Klaus Frank <git@frank.fyi>
To: linux-doc@vger.kernel.org
Subject: [PATCH] [patch] Documentation: tfix: Fix invalid reference to
 /sys/modules instead of /sys/module
Message-ID: <jvhevji3smzia35rxb4g2xbcj7z5f542h2iz53n5a44peob3cz@52qi2oil5zwi>
Reply-To: Klaus Frank <vger.kernel.org@frank.fyi>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-----BEGIN PGP MESSAGE-----

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
V5Nx9IPsqfOTulYHLt7+wsj/Ag==
=mK0l
-----END PGP MESSAGE-----


