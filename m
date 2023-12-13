Return-Path: <linux-doc+bounces-4863-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7B80FA7D
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 23:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8414A281A29
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 22:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA1939E;
	Tue, 12 Dec 2023 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GU1u2vFg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAB8AD;
	Tue, 12 Dec 2023 14:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702420838; x=1733956838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d26NH9arjdhzXdHnhZX1oap+1X0EpGr92P6WHZRm74c=;
  b=GU1u2vFgM8uCurIdWGKQX7jV8iJPQ3+KIQoQo1MnIKCZrQ8m7BMbjMfh
   /rrA1YZVbP4E2Vx9q0XNHjwvuPrtoKXRpi861oWGDabJuiTkKT5lb8Lrs
   Q6/JrJem/pzT/wWgEoiiga4NKn/sd5kBrJP7Gylbl0W+ImDnWvUZVl/bd
   lw3Gg22BsWNoUmrJdyLSag3ljS/qkxA3HmnuVDXa1MUIY5bP+P7fYEsv/
   po9SthCoiVj3d9qP/AA2c167UUWznBARBBtf8dP8eaubGPhOv2NZdPUVK
   Zos6t185NRCF9nSOM5XMcMUkjKDl4MJpubf9WD69zbLjJ7OVi1iL9K3td
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2051275"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="2051275"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 14:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897094424"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="897094424"
Received: from adamjame-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.48.205])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 14:40:35 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 89D0210A4DA; Wed, 13 Dec 2023 01:40:32 +0300 (+03)
Date: Wed, 13 Dec 2023 01:40:32 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] Documentation, mm/unaccepted: document accept_memory
 kernel parameter
Message-ID: <20231212224032.4dt6nttlqyru4w7d@box>
References: <20231212-accept_memory_param-v1-1-a9012402b887@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212-accept_memory_param-v1-1-a9012402b887@suse.cz>

On Tue, Dec 12, 2023 at 06:21:43PM +0100, Vlastimil Babka wrote:
> The accept_memory kernel parameter was added in commit dcdfdd40fa82
> ("mm: Add support for unaccepted memory") but not listed in the
> kernel-parameters doc. Add it there.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

