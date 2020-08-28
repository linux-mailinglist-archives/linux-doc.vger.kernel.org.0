Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A965C2557F5
	for <lists+linux-doc@lfdr.de>; Fri, 28 Aug 2020 11:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgH1JrX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Aug 2020 05:47:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:38834 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728016AbgH1JrU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 Aug 2020 05:47:20 -0400
IronPort-SDR: +0zdhMDHpA44RekPHMUnEGkCiZBPnKVLnQcPmZMmBrkXhFCiYEZXPkSdO1vv69WLvrLawkOkCJ
 M2vK2CM1La6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="144387749"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="144387749"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 02:47:18 -0700
IronPort-SDR: ++VrUVoAlkokasVkojxlqn1kLHsMNY+Gx5ZBRGKTzMqemdjZC21ihTVD5f8YPYdEq+6qzaq50o
 3/nGZ6oqzMUA==
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="475617485"
Received: from junhoson-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.35.131])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 02:47:16 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Drew DeVault <sir@cmpwn.com>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: Re: [PATCH] submitting-patches.rst: streamline for git usage
In-Reply-To: <20200827174237.121004-1-sir@cmpwn.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200827174237.121004-1-sir@cmpwn.com>
Date:   Fri, 28 Aug 2020 12:47:13 +0300
Message-ID: <87y2lz3xwe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 27 Aug 2020, Drew DeVault <sir@cmpwn.com> wrote:
> This document is a bit intimidating to new patch submitters, and this
> change streamlines it a bit. We presume git usage, because it's much
> easier to use and most devs coming at the kernel are likely to be
> familiar with it.

...and those who deviate from git should know what they're doing without
this.

> -2) Describe your changes
> +1) Describe your changes
>  ------------------------

I suggest just tossing the numbering altoghether while at it.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
