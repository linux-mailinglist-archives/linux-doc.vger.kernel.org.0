Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164E35F590A
	for <lists+linux-doc@lfdr.de>; Wed,  5 Oct 2022 19:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiJERWm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Oct 2022 13:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiJERWl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Oct 2022 13:22:41 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842747D1F5;
        Wed,  5 Oct 2022 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664990560; x=1696526560;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=QPECApqlN0wp6pBzU1AFMijHUtHHCxXdPWVpt0R//EA=;
  b=dJ3HoVRO4Ou6ClD8rR0h4+lzgK1a0R4tccMgl1wNCqX7xhD0CpTQ2WX/
   MrRdeTBKvmBDfM0Mkmx9TuGXbOKlqxKoajoHErc051G0J1jWOV3i+WWvC
   YCO0pkcbCACMIWbTjXO1GVGrdVIp8anWhxyBvAN1auWHf1fjFK3/dcTf8
   N+RE4DgR/6feiX5jJRS/skCg4SQqTLwVnmEGLbiUb7UtPWBReS/JuBRts
   e0UV9p0GI8doukwheO+mMiZfhT0DSoBTMf72U346EWBe73FPxnRRhPH+3
   fPEUuhGgXxkSaG4l3jhsBb0lRjA76dsYxp+ERnkBjbS3Lp+XbMjbIulnh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="367333335"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="367333335"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 10:22:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="799560939"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="799560939"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.39.173])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 10:22:38 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/5] docs: Switch the default HTML theme to alabaster
In-Reply-To: <20221004201222.281845-2-corbet@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221004201222.281845-1-corbet@lwn.net>
 <20221004201222.281845-2-corbet@lwn.net>
Date:   Wed, 05 Oct 2022 20:22:35 +0300
Message-ID: <87o7uqqj6s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 04 Oct 2022, Jonathan Corbet <corbet@lwn.net> wrote:
> The read-the-docs theme is not entirely attractive and doesn't give us
> control over the left column.  "Alabaster" is deemed the default Sphinx
> theme, it is currently maintained and shipped bundled with Sphinx itself,
> so there is no need to install it separately.  Switch over to this theme as
> the default for building kernel documentation; the DOCS_THEME environment
> variable can still be used to select a different theme.
>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/conf.py | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 22c9d4df1967..629f4afeb0eb 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -194,6 +194,24 @@ finally:
>      else:
>          version = release = "unknown version"
>  
> +#
> +# HACK: there seems to be no easy way for us to get at the version and
> +# release information passed in from the makefile...so go pawing through the
> +# command-line options and find it for ourselves.
> +#
> +def get_cline_version():
> +    c_version = c_release = ''
> +    for arg in sys.argv:
> +        if arg.startswith('version='):
> +            c_version = arg[8:]
> +        elif arg.startswith('release='):
> +            c_release = arg[8:]
> +    if c_version:
> +        if c_release:
> +            return c_version + '-' + c_release
> +        return c_version
> +    return version # Whatever we came up with before
> +

This is a bit sad. There should be a way to set the description in the
theme template at a later time, when version is available. This is how
the rtd theme does it [1].

Would only need to inject one line in the template html, but I don't
know how to do that. :(

I wonder if the right way to do this would be to define our own theme,
which would mostly just extend alabaster, but would have small tweaks
[2]. Where are the Jinja experts when you need one?!


BR,
Jani.


[1] https://github.com/readthedocs/sphinx_rtd_theme/blob/master/sphinx_rtd_theme/layout.html#L150
[2] https://www.sphinx-doc.org/en/master/templating.html

>  # The language for content autogenerated by Sphinx. Refer to documentation
>  # for a list of supported languages.
>  #
> @@ -247,7 +265,7 @@ highlight_language = 'none'
>  # a list of builtin themes.
>  
>  # Default theme
> -html_theme = 'sphinx_rtd_theme'
> +html_theme = 'alabaster'
>  html_css_files = []
>  
>  if "DOCS_THEME" in os.environ:
> @@ -324,6 +342,10 @@ if  html_theme == 'classic':
>          'bodyfont':            "serif",
>          'headfont':            "sans-serif",
>      }
> +else:
> +    html_theme_options = {
> +        'description': get_cline_version(),
> +    }
>  
>  sys.stderr.write("Using %s theme\n" % html_theme)
>  
> @@ -371,7 +393,7 @@ html_use_smartypants = False
>  
>  # Custom sidebar templates, maps document names to template names.
>  # Note that the RTD theme ignores this
> -html_sidebars = { '**': ['searchbox.html', 'localtoc.html', 'sourcelink.html']}
> +html_sidebars = { '**': ["about.html", 'searchbox.html', 'localtoc.html', 'sourcelink.html']}
>  
>  # Additional templates that should be rendered to pages, maps page names to
>  # template names.

-- 
Jani Nikula, Intel Open Source Graphics Center
