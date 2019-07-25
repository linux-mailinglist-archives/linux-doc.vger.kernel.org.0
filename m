Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9818375B19
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jul 2019 00:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfGYW5R (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Jul 2019 18:57:17 -0400
Received: from smtprelay0049.hostedemail.com ([216.40.44.49]:33929 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726529AbfGYW5R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Jul 2019 18:57:17 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id CDF89181D33FC;
        Thu, 25 Jul 2019 22:57:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::,RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3866:3867:3868:3870:4321:5007:7576:8957:10004:10400:10848:11026:11232:11658:11914:12297:12438:12679:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21627:30054:30064:30070:30091,0,RBL:error,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: linen95_3f6004f62bf19
X-Filterd-Recvd-Size: 1633
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Thu, 25 Jul 2019 22:57:15 +0000 (UTC)
Message-ID: <dd43e8789b82a072b89911f41560bbc203d11771.camel@perches.com>
Subject: Re: [PATCH v6] Documentation/checkpatch: Prefer stracpy over
 strcpy/strlcpy/strncpy.
From:   Joe Perches <joe@perches.com>
To:     NitinGote <nitin.r.gote@intel.com>, keescook@chromium.org
Cc:     corbet@lwn.net, akpm@linux-foundation.org, apw@canonical.com,
        linux-doc@vger.kernel.org, kernel-hardening@lists.openwall.com
Date:   Thu, 25 Jul 2019 15:57:13 -0700
In-Reply-To: <20190725112219.6244-1-nitin.r.gote@intel.com>
References: <20190725112219.6244-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2019-07-25 at 16:52 +0530, NitinGote wrote:
> From: Nitin Gote <nitin.r.gote@intel.com>
> 
> Added check in checkpatch.pl to deprecate strcpy(), strlcpy() and
> strncpy() in favor of stracpy().
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> +our %deprecated_string_apis = (
> +	"strcpy"		=> "stracpy",
> +	"strlcpy"		=> "stracpy",
> +	"strncpy"		=> "stracpy - for non-NUL-terminated uses, strncpy dest should be __nonstring",
> +);

Maybe:

our %deprecated_string_apis = (
	"strcpy"		=> "stracpy or strscpy",
	"strlcpy"		=> "stracpy or strscpy",
	"strncpy"		=> "stracpy or strscpy - for non-NUL-terminated uses, strncpy dest should be __nonstring",
);


