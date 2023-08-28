Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B7278B7DC
	for <lists+linux-doc@lfdr.de>; Mon, 28 Aug 2023 21:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbjH1TJf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Aug 2023 15:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbjH1TJH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Aug 2023 15:09:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA4AE0;
        Mon, 28 Aug 2023 12:09:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6CE8741;
        Mon, 28 Aug 2023 21:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693249660;
        bh=UHGjh+obSoM9ki2pC4sSgE4WTcKyZIy0ttcMBHz5P7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c96WWnLxQ42XcIPetDFppjkXjBwgEO4HHoZ675+HTmmLlEf07rrkmm2iVBH2HWYDm
         8a03rO9G/mmf+OroN1MdSj6Rq7LqoXvQN5DWsZXs7dQvFQOxWTQzzD38uievwM8HV1
         Y4L0avQ1/MkrTscZ8FRYdq9wSKRwQtoonNQHFdZA=
Date:   Mon, 28 Aug 2023 22:09:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netdev: document patchwork patch states
Message-ID: <20230828190911.GR14596@pendragon.ideasonboard.com>
References: <20230828184447.2142383-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230828184447.2142383-1-kuba@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jakub,

Thank you for the patch.

On Mon, Aug 28, 2023 at 11:44:41AM -0700, Jakub Kicinski wrote:
> The patchwork states are largely self-explanatory but small
> ambiguities may still come up. Document how we interpret
> the states in networking.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/maintainer-netdev.rst | 27 ++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
> index c1c732e9748b..5d16fbb93d25 100644
> --- a/Documentation/process/maintainer-netdev.rst
> +++ b/Documentation/process/maintainer-netdev.rst
> @@ -120,7 +120,32 @@ Status of a patch can be checked by looking at the main patchwork
>    https://patchwork.kernel.org/project/netdevbpf/list/
>  
>  The "State" field will tell you exactly where things are at with your
> -patch. Patches are indexed by the ``Message-ID`` header of the emails
> +patch:
> +
> +================== =============================================================
> +Patch state        Description
> +================== =============================================================
> +New, Under review  pending review, patch is in the maintainer’s queue for review

Is there a meaningful distinction between "New" and "Under review", or
are they exactly the same ? The former sounds like nobody has looked at
the patch yet, while the latter seems to indicate someone has assigned
the task of reviewing the patch to themselves, but maybe netdev uses
those two states differently ?

> +Accepted           patch was applied to the appropriate networking tree, this is
> +                   usually set automatically by the pw-bot
> +Needs ACK          waiting for an ack from an area maintainer or testing

How does this differ from "Under review" ?

> +Changes requested  patch has not passed the review, new revision is expected
> +                   with appropriate code and commit message changes
> +Rejected           patch has been rejected and new revision is not expected
> +Not applicable     patch is expected to be applied outside of the networking
> +                   subsystem
> +Awaiting upstream  patch should be reviewed and handled by appropriate
> +                   sub-maintainer, who will send it on to the networking trees
> +Deferred           patch needs to be reposted later, usually due to dependency
> +                   or because it was posted for a closed tree
> +Superseded         new version of the patch was posted, usually set by the
> +                   pw-bot
> +RFC                not to be applied, usually not in maintainer’s review queue,
> +                   pw-bot can automatically set patches to this state based
> +		   on subject tags

Incorrect indentation.

> +================== =============================================================
> +
> +Patches are indexed by the ``Message-ID`` header of the emails
>  which carried them so if you have trouble finding your patch append
>  the value of ``Message-ID`` to the URL above.
>  

-- 
Regards,

Laurent Pinchart
