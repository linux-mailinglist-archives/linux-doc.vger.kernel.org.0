Return-Path: <linux-doc+bounces-1838-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D117E41AF
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 15:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03D06B20BD2
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 14:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B2730FAC;
	Tue,  7 Nov 2023 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183B10A25
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 14:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBAAC433C9;
	Tue,  7 Nov 2023 14:18:26 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-doc@vger.kernel.org,
	Marielle Novastrider <marielle@novastrider.com>
Cc: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/arm64: Fix typos in elf_hwcaps
Date: Tue,  7 Nov 2023 14:18:24 +0000
Message-Id: <169936667590.2397489.11885889127555102204.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031200838.55569-1-marielle@novastrider.com>
References: <20231031200838.55569-1-marielle@novastrider.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 31 Oct 2023 20:08:38 +0000, Marielle Novastrider wrote:
> Small typos in register and field names.
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] Documentation/arm64: Fix typos in elf_hwcaps
      https://git.kernel.org/arm64/c/6eeeb4c7e4b5

-- 
Catalin


