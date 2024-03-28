Return-Path: <linux-doc+bounces-12965-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6D890418
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 16:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE3F1C29C10
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 15:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C5A12F59C;
	Thu, 28 Mar 2024 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUYZHxma"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C43B12F385;
	Thu, 28 Mar 2024 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711641522; cv=none; b=Si79WL+mcP8gaDngwOnQGoSyMEhq+t92qM3gAur8r8d2c/pJvCEgLWgsBlpUttUCO5/VcgMAphjEHL9KGBVIR0Vi4H7t+Y4gXKVe+lH/mltjos8Wq3saKcZ2wlcAN1RSgIzEQ2Sp/t00FM73bydbHUDT7LvSfPU3yBBtAnl3X5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711641522; c=relaxed/simple;
	bh=AbM2WN9pbEniGvK98xcSrbQUB/L/CWtvNllKxZcHCUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFYjXF2YxnVFeXMWUN2YaOVEmZGCxCam7BpdTu0NNIsU51rRIdjRuJBOq3gEfjlOWYQ0p0FmJgnmUB0a+8TkCJKyzkhlDfSrXeBm/JCGQmGThrmNxqx0bGEWZ3LdVPCZvbyqHW70825nXJt15lLuQxU37+PLLkzJu0GVnpmz888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUYZHxma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07153C433C7;
	Thu, 28 Mar 2024 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641522;
	bh=AbM2WN9pbEniGvK98xcSrbQUB/L/CWtvNllKxZcHCUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qUYZHxmaJflCD1nUBHvOy8dWgPX0GtAwKD/v/ZEhSiq62TqwAbVcG9M80sJvWdbDA
	 rv+4pKWJbvQmjW0eukMyREiQ9WJiIkpsQWmtMFkiulZk4+mz+LAZ3IEwlrFkl4va3O
	 +LMZpMJ45EPjKBupMMDuhhRnXIxy0TxUx1n0Nxkms+iVF5/qKKsx6sfsTVHYfpISzy
	 KgZcU8+GyLApOYZymIl+hflEsZ0S12W2xwShXxjQHRM0sBv1p4wIeg7jBVNoELtIal
	 Ces79067msGpMR6LtIeuovr5kI8TuROdEb+BYMLvHaABympji1R0jJpnzXB8tegk8N
	 QXVb8IsCRNMyw==
Message-ID: <9be0ea6e-b0f4-407e-b20f-e12188b32ac3@kernel.org>
Date: Thu, 28 Mar 2024 16:58:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: dev-tools: Add link to RV docs
To: Brendan Jackman <jackmanb@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, rostedt@goodmis.org
References: <20240328124947.2107524-1-jackmanb@google.com>
Content-Language: en-US, pt-BR, it-IT
From: Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20240328124947.2107524-1-jackmanb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/24 13:49, Brendan Jackman wrote:
> I could not remember the name of this system and it's pretty hard to
> find without the right keywords. I had to ask an LLM!
> 
> Drop a breadcrumb to help people find it in the future.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

Acked-by: Daniel Bristot de Oliveira <bristot@kernel.org>

Thanks!
-- Daniel



