Return-Path: <linux-doc+bounces-31548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015D9D8663
	for <lists+linux-doc@lfdr.de>; Mon, 25 Nov 2024 14:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C6628B1D9
	for <lists+linux-doc@lfdr.de>; Mon, 25 Nov 2024 13:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B706B1AB528;
	Mon, 25 Nov 2024 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYVYYmyX"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0B1A9B5D;
	Mon, 25 Nov 2024 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541292; cv=none; b=EnqQChCyRJbVXgfIqZpVnIUFwpMjnKBkE5jDE5b0eG9uMhGuAnsxUzkyaZu8JtHq4CMaK400vzx2CANFRPyEaLqOlXcpvjGk6L2Cz7W+zzANv0AXFkV6OoSTuX8tlqMaMVaMhS6Ou66NaZv9m/w+pKkuYdHGT7V064AoOC+YFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541292; c=relaxed/simple;
	bh=sESHCfmHmHaI8KY+ZzE7Zdm/gqTJOAtsxdweAV4cr24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhRtuN/DpmI68NAg5vpr8s09DwvtbGplZHQf+kAqXaCnTa9bf/SsCpuEhXkV/vHF5NKymFZjt32sfpVH2J1iem34VxInlSGAQ3nf/4OZfFf1byBT+FJDTSGRgqRBaHCgdybW6X69nkNUgDUhmNuUUywiI3TI1hvIvAB1FwrVJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYVYYmyX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732541291; x=1764077291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sESHCfmHmHaI8KY+ZzE7Zdm/gqTJOAtsxdweAV4cr24=;
  b=FYVYYmyXzzHVWXXM7D1ICtDLK66t3p2D71xlucFA2hV8w+Byrt4PrFRO
   sO2WsD9k4deEqOtutAVh86S7r7h0N7cv9fUCmMDAxXnhWqLnj0LHWnTd9
   GDrKPPZ8ijwVAO8mNuToGJHGkgNCIPtquBo+d2A5LkTnyqMXw1Mfoh8jY
   ExZdaf4XOUICL8BYtDzZbC4rW3zuAopn9Pk1ByARgEP5OVEtWvZT+4vFK
   l1LHRHho9QdNI3w2sbBVjoq+StntlcyomyRkzIPPekG/THYjr2YDYyp9r
   yTa1C+e7AzUlIknzab5fkX8UPH3jIz3YFGvSWdjUt+cyvNEx1nzO0S6nz
   A==;
X-CSE-ConnectionGUID: KcGPdD5HTGaihm9lrXLvBQ==
X-CSE-MsgGUID: uZYkuI3+RkKPf5TowViHXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55151949"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="55151949"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 05:28:10 -0800
X-CSE-ConnectionGUID: EKBxTmvNRvKCf6ayHaqmfQ==
X-CSE-MsgGUID: s4BsTlWTRJ2gm3aQ0d27lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91732760"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2024 05:28:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFZ8C-0006Qj-2o;
	Mon, 25 Nov 2024 13:28:00 +0000
Date: Mon, 25 Nov 2024 21:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 05/25] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <202411252137.GpJ4mLOe-lkp@intel.com>
References: <31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple@nvidia.com>

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20241125-094004
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple%40nvidia.com
patch subject: [PATCH v3 05/25] fs/dax: Create a common implementation to break DAX layouts
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241125/202411252137.GpJ4mLOe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252137.GpJ4mLOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252137.GpJ4mLOe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dax_break_mapping" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

