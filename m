Return-Path: <linux-doc+bounces-4981-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354F8115B7
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 16:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C99F0B20EF9
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 15:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D532FC40;
	Wed, 13 Dec 2023 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="JTXP13yT"
X-Original-To: linux-doc@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEABE10DA;
	Wed, 13 Dec 2023 07:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0syRyLMAduRkBnFmUBvq2qT/Oe9rAZr7h6oDqIb7iMk=; b=JTXP13yTJE1qIR8YJpDu+CM6kV
	P5N8tFNlWOqyiNeB70fu5+TxcbgrYR34ogDKUT2coknSN7ryMVbmHUPiQdcmwpmZVLQ11kKsBX61c
	/ny6uuPKQ+7mU6lQhehSSz0gcI/19hgmMEPqYItWKR0tEbcfYa3wZtHBuuT0cS9JlePBfbnSrAWHX
	/KwNpgI11HYIZ1/qON0DIyjzgn4Lhza1MPUaV0Zmpb+iaohxBX3iYT8i6kw9PAkdrkReCKPg6p+Hc
	1bdmFLvsOMp0dcCXBEnMLK49IBKz8fsrjIp7fs4gYbBLwPFeJPQ5cdTFQGXnUVJGkcyuujFm8sjPp
	X0Z+Gj/g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnU-00BoEy-02;
	Wed, 13 Dec 2023 15:05:16 +0000
Date: Wed, 13 Dec 2023 15:05:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2] dcache: remove unnecessary NULL check in dget_dlock()
Message-ID: <20231213150515.GM1674809@ZenIV>
References: <20231106134417.98833-1-vegard.nossum@oracle.com>
 <fb2cf7c5-cced-4ea3-bf5a-a442a0e64bda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb2cf7c5-cced-4ea3-bf5a-a442a0e64bda@oracle.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Dec 13, 2023 at 03:40:33PM +0100, Vegard Nossum wrote:
> [Fixed up a couple of bad addresses in Cc]
> 
> Hi,
> 
> I didn't get a response to this v2 of the patch below and I don't see it
> in vfs.git.
> 
> Was there something wrong or is it just awaiting review? Is there
> anything I can do or help with? I would be happy to try to review other
> patches if there is anything outstanding.

commit 1b6ae9f6e6c3e3c35aad0f11b116a81780b8aa03 (work.dcache)
Author: Vegard Nossum <vegard.nossum@oracle.com>
Date:   Mon Nov 6 14:44:17 2023 +0100

    dcache: remove unnecessary NULL check in dget_dlock()

