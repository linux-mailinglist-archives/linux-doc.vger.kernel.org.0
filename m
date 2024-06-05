Return-Path: <linux-doc+bounces-17726-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D908FC21B
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 05:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19A51C21D51
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 03:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6556BB5C;
	Wed,  5 Jun 2024 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0oP/w7c"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5061FF3;
	Wed,  5 Jun 2024 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717557065; cv=none; b=CeSZqBC6T3WmfnkwfNPSr0e2Ffv8LISviiNDGT5YVJNxrWb060iScnh9SYtYkAQER+oSiKBAVVLeAV7ib1ggEcHnnoFu0c6wNKG7qCLOaLrEhRJmPakj4FPtj/vabXCt0W8SLkAVvI7yDVaJrsJWA0GiitV4RJDFQ3OUh1yXtME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717557065; c=relaxed/simple;
	bh=pjZpUgCw+hP+8lojGuWnBXzp7P0PYQVVKmZPnH2Oy0A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohbfmoKH8YynqdpglUhl37xfTteZUa2Nfj+sYe5nY6X+zLwXfh5fo/6NgFJLb2S/mDFOY6/Gcbz/Lm/CrS80SbY7dvKpBecHP1/sGpECoMaWUXhqkG2dUDGmrCcnT65lhYIHjphv72EG+SEXOCDNf/38KUEumDidukttAzcQhjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0oP/w7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32502C32781;
	Wed,  5 Jun 2024 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717557065;
	bh=pjZpUgCw+hP+8lojGuWnBXzp7P0PYQVVKmZPnH2Oy0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n0oP/w7cmujFB9ORdt+sgJd7fdsZgBrw1kJ8UXP3J7hYRxPbxKwb4QWDv5rsgKKRi
	 VMcBZIrMtnCYcGm2LMbCRcCHVXUToftqK0/X64i1P/GHb4dt24KrEdxziAKIVDhyTJ
	 AcC1btU8IHzq1XOYgHTSQpCJsjBRyDAGks/HNVhQs4wxoNCMKbYpUyM2b4fxS9W7F3
	 dgjnZVvb2yvgpqNm2WYkdf/FQmKilcP5FFJieAFvgIqhd+m7UEAaDyrD1BsVlZtnka
	 PhEkM6qYxAnqiJgmneXYUMcr5/eaLDEw+o1MXRYJ0/sQ3BiQHd1nLPj9GaHMMSXUQA
	 XrSZK04Z1qtiw==
Date: Tue, 4 Jun 2024 20:11:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Itay Avraham <itayavr@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Aron
 Silverton <aron.silverton@oracle.com>, Dan Williams
 <dan.j.williams@intel.com>, David Ahern <dsahern@kernel.org>, Christoph
 Hellwig <hch@infradead.org>, Jiri Pirko <jiri@nvidia.com>, Leonid Bloch
 <lbloch@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 linux-cxl@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 0/8] Introduce fwctl subystem
Message-ID: <20240604201103.4b2973c5@kernel.org>
In-Reply-To: <0-v1-9912f1a11620+2a-fwctl_jgg@nvidia.com>
References: <0-v1-9912f1a11620+2a-fwctl_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Jun 2024 12:53:16 -0300 Jason Gunthorpe wrote:
>  Broadcom Networking - https://lore.kernel.org/r/Zf2n02q0GevGdS-Z@C02YVCJELVCG

Please double check with Broadcom if they are still supportive, 
in the current form.

Please include lore links to previous postings.

Please carry my nack on future version. At least as long as
the write access checks are.. good-faith-based.

