Return-Path: <linux-doc+bounces-42449-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED7A7EFE4
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 23:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444B13ACD49
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 21:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5171022333A;
	Mon,  7 Apr 2025 21:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwL8aQEt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B90223711;
	Mon,  7 Apr 2025 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062694; cv=none; b=q7T/h/Xcw5hmEVVXjKlIN+Jvd0Gb6L0aYbT2qa2DmNbmD8BCTpI6yw81QBOYNPXrO5GFlMQWKU3W6GmdG8KatfY10MQyufteaveToXQaWmQVb/+p7I8bGfGrLvSTKTw59oHU3Fz9DXHw7+xFCFVxqPIC0psZ6wMy6iFDKU97Sgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062694; c=relaxed/simple;
	bh=vdDsdHvrPhmRFXzNntYt8skkqZxrOJYUkJwJZmOSgQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOKs3yLnZvIGcdd/Sb4XJQzf9k7QrzeLTznMyoYYjxJ2lVhjOUBvzKXJuDGuK1zKSVfjwdYo1NnqP2AKpasOqiLW+dT4cklE19DVfefOJAYJYIDTEy/Q7O+7fFYwuszpRPno7IZsRuMyCyS1ZhCbQtBDOz3KkesUv6qlWQ23aps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwL8aQEt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744062692; x=1775598692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vdDsdHvrPhmRFXzNntYt8skkqZxrOJYUkJwJZmOSgQ8=;
  b=AwL8aQEtDY8XvZuO1GzcgO5tOJUfSdF0QhLLpA48v7wIS4he5v9VcpjK
   QwI/T9jR0JzsSx34+pmjI4rnydJnC5Ll0r7zeangL37higuweM5cAdwuH
   8XW9j1n7wAjs94JLxVaNtgnNNsUy2G4egFJ/kBQtKely1UZrMxsOYd0fa
   6FKLvZNEUJ0Zf/rCzo/wTHI/G8qgEIKiNjYxTfCbb1/105Y7wvnkWtx4H
   8r11L13mNH8CrWUyPlOpzgSHpMTrtO6A5KBuOty8X/9XGamCMyH0dLjmM
   NsDt25t+zLplw431vStjBis08yWS0+K9dK5lZAJddlCNEx5gX6utSJ0in
   A==;
X-CSE-ConnectionGUID: 8Zmo8lQwQ7a2+LORjsuYGA==
X-CSE-MsgGUID: +/8V7MtgRNGnCj6bZeBtAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49268604"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="49268604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 14:51:28 -0700
X-CSE-ConnectionGUID: ZMM1AVx+Sq+Ez9u4RKhc+g==
X-CSE-MsgGUID: wmICPpSmS0eeBOFAYPRYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="133055758"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa004.jf.intel.com with ESMTP; 07 Apr 2025 14:51:27 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Slawomir Mrozowicz <slawomirx.mrozowicz@intel.com>,
	anthony.l.nguyen@intel.com,
	jedrzej.jagielski@intel.com,
	przemyslaw.kitszel@intel.com,
	jiri@resnulli.us,
	horms@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Bharath R <bharath.r@intel.com>,
	Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Subject: [PATCH net-next 05/15] ixgbe: add E610 functions for acquiring flash data
Date: Mon,  7 Apr 2025 14:51:09 -0700
Message-ID: <20250407215122.609521-6-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250407215122.609521-1-anthony.l.nguyen@intel.com>
References: <20250407215122.609521-1-anthony.l.nguyen@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Slawomir Mrozowicz <slawomirx.mrozowicz@intel.com>

Read NVM related info from the flash.

Add several helper functions used to access the flash data,
find memory banks, calculate offsets, calculate the flash size.

Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Reviewed-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Tested-by: Bharath R <bharath.r@intel.com>
Signed-off-by: Slawomir Mrozowicz <slawomirx.mrozowicz@intel.com>
Co-developed-by: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Signed-off-by: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Co-developed-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Signed-off-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c | 507 +++++++++++++++++-
 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h |   1 +
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |   4 +
 .../ethernet/intel/ixgbe/ixgbe_type_e610.h    |  40 +-
 4 files changed, 550 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
index 00935747c8c5..5d15fbd2e1a6 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c
@@ -2266,6 +2266,511 @@ int ixgbe_nvm_validate_checksum(struct ixgbe_hw *hw)
 	return err;
 }
 
+/**
+ * ixgbe_discover_flash_size - Discover the available flash size
+ * @hw: pointer to the HW struct
+ *
+ * The device flash could be up to 16MB in size. However, it is possible that
+ * the actual size is smaller. Use bisection to determine the accessible size
+ * of flash memory.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_discover_flash_size(struct ixgbe_hw *hw)
+{
+	u32 min_size = 0, max_size = IXGBE_ACI_NVM_MAX_OFFSET + 1;
+	int err;
+
+	err = ixgbe_acquire_nvm(hw, IXGBE_RES_READ);
+	if (err)
+		return err;
+
+	while ((max_size - min_size) > 1) {
+		u32 offset = (max_size + min_size) / 2;
+		u32 len = 1;
+		u8 data;
+
+		err = ixgbe_read_flat_nvm(hw, offset, &len, &data, false);
+		if (err == -EIO &&
+		    hw->aci.last_status == IXGBE_ACI_RC_EINVAL) {
+			err = 0;
+			max_size = offset;
+		} else if (!err) {
+			min_size = offset;
+		} else {
+			/* an unexpected error occurred */
+			goto err_read_flat_nvm;
+		}
+	}
+
+	hw->flash.flash_size = max_size;
+
+err_read_flat_nvm:
+	ixgbe_release_nvm(hw);
+
+	return err;
+}
+
+/**
+ * ixgbe_read_sr_base_address - Read the value of a Shadow RAM pointer word
+ * @hw: pointer to the HW structure
+ * @offset: the word offset of the Shadow RAM word to read
+ * @pointer: pointer value read from Shadow RAM
+ *
+ * Read the given Shadow RAM word, and convert it to a pointer value specified
+ * in bytes. This function assumes the specified offset is a valid pointer
+ * word.
+ *
+ * Each pointer word specifies whether it is stored in word size or 4KB
+ * sector size by using the highest bit. The reported pointer value will be in
+ * bytes, intended for flat NVM reads.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_read_sr_base_address(struct ixgbe_hw *hw, u16 offset,
+				      u32 *pointer)
+{
+	u16 value;
+	int err;
+
+	err = ixgbe_read_ee_aci_e610(hw, offset, &value);
+	if (err)
+		return err;
+
+	/* Determine if the pointer is in 4KB or word units */
+	if (value & IXGBE_SR_NVM_PTR_4KB_UNITS)
+		*pointer = (value & ~IXGBE_SR_NVM_PTR_4KB_UNITS) * SZ_4K;
+	else
+		*pointer = value * sizeof(u16);
+
+	return 0;
+}
+
+/**
+ * ixgbe_read_sr_area_size - Read an area size from a Shadow RAM word
+ * @hw: pointer to the HW structure
+ * @offset: the word offset of the Shadow RAM to read
+ * @size: size value read from the Shadow RAM
+ *
+ * Read the given Shadow RAM word, and convert it to an area size value
+ * specified in bytes. This function assumes the specified offset is a valid
+ * area size word.
+ *
+ * Each area size word is specified in 4KB sector units. This function reports
+ * the size in bytes, intended for flat NVM reads.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_read_sr_area_size(struct ixgbe_hw *hw, u16 offset, u32 *size)
+{
+	u16 value;
+	int err;
+
+	err = ixgbe_read_ee_aci_e610(hw, offset, &value);
+	if (err)
+		return err;
+
+	/* Area sizes are always specified in 4KB units */
+	*size = value * SZ_4K;
+
+	return 0;
+}
+
+/**
+ * ixgbe_determine_active_flash_banks - Discover active bank for each module
+ * @hw: pointer to the HW struct
+ *
+ * Read the Shadow RAM control word and determine which banks are active for
+ * the NVM, OROM, and Netlist modules. Also read and calculate the associated
+ * pointer and size. These values are then cached into the ixgbe_flash_info
+ * structure for later use in order to calculate the correct offset to read
+ * from the active module.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_determine_active_flash_banks(struct ixgbe_hw *hw)
+{
+	struct ixgbe_bank_info *banks = &hw->flash.banks;
+	u16 ctrl_word;
+	int err;
+
+	err = ixgbe_read_ee_aci_e610(hw, IXGBE_E610_SR_NVM_CTRL_WORD,
+				     &ctrl_word);
+	if (err)
+		return err;
+
+	if (FIELD_GET(IXGBE_SR_CTRL_WORD_1_M, ctrl_word) !=
+	    IXGBE_SR_CTRL_WORD_VALID)
+		return -ENODATA;
+
+	if (!(ctrl_word & IXGBE_SR_CTRL_WORD_NVM_BANK))
+		banks->nvm_bank = IXGBE_1ST_FLASH_BANK;
+	else
+		banks->nvm_bank = IXGBE_2ND_FLASH_BANK;
+
+	if (!(ctrl_word & IXGBE_SR_CTRL_WORD_OROM_BANK))
+		banks->orom_bank = IXGBE_1ST_FLASH_BANK;
+	else
+		banks->orom_bank = IXGBE_2ND_FLASH_BANK;
+
+	if (!(ctrl_word & IXGBE_SR_CTRL_WORD_NETLIST_BANK))
+		banks->netlist_bank = IXGBE_1ST_FLASH_BANK;
+	else
+		banks->netlist_bank = IXGBE_2ND_FLASH_BANK;
+
+	err = ixgbe_read_sr_base_address(hw, IXGBE_E610_SR_1ST_NVM_BANK_PTR,
+					 &banks->nvm_ptr);
+	if (err)
+		return err;
+
+	err = ixgbe_read_sr_area_size(hw, IXGBE_E610_SR_NVM_BANK_SIZE,
+				      &banks->nvm_size);
+	if (err)
+		return err;
+
+	err = ixgbe_read_sr_base_address(hw, IXGBE_E610_SR_1ST_OROM_BANK_PTR,
+					 &banks->orom_ptr);
+	if (err)
+		return err;
+
+	err = ixgbe_read_sr_area_size(hw, IXGBE_E610_SR_OROM_BANK_SIZE,
+				      &banks->orom_size);
+	if (err)
+		return err;
+
+	err = ixgbe_read_sr_base_address(hw, IXGBE_E610_SR_NETLIST_BANK_PTR,
+					 &banks->netlist_ptr);
+	if (err)
+		return err;
+
+	err = ixgbe_read_sr_area_size(hw, IXGBE_E610_SR_NETLIST_BANK_SIZE,
+				      &banks->netlist_size);
+
+	return err;
+}
+
+/**
+ * ixgbe_get_flash_bank_offset - Get offset into requested flash bank
+ * @hw: pointer to the HW structure
+ * @bank: whether to read from the active or inactive flash bank
+ * @module: the module to read from
+ *
+ * Based on the module, lookup the module offset from the beginning of the
+ * flash.
+ *
+ * Return: the flash offset. Note that a value of zero is invalid and must be
+ * treated as an error.
+ */
+static int ixgbe_get_flash_bank_offset(struct ixgbe_hw *hw,
+				       enum ixgbe_bank_select bank,
+				       u16 module)
+{
+	struct ixgbe_bank_info *banks = &hw->flash.banks;
+	enum ixgbe_flash_bank active_bank;
+	bool second_bank_active;
+	u32 offset, size;
+
+	switch (module) {
+	case IXGBE_E610_SR_1ST_NVM_BANK_PTR:
+		offset = banks->nvm_ptr;
+		size = banks->nvm_size;
+		active_bank = banks->nvm_bank;
+		break;
+	case IXGBE_E610_SR_1ST_OROM_BANK_PTR:
+		offset = banks->orom_ptr;
+		size = banks->orom_size;
+		active_bank = banks->orom_bank;
+		break;
+	case IXGBE_E610_SR_NETLIST_BANK_PTR:
+		offset = banks->netlist_ptr;
+		size = banks->netlist_size;
+		active_bank = banks->netlist_bank;
+		break;
+	default:
+		return 0;
+	}
+
+	switch (active_bank) {
+	case IXGBE_1ST_FLASH_BANK:
+		second_bank_active = false;
+		break;
+	case IXGBE_2ND_FLASH_BANK:
+		second_bank_active = true;
+		break;
+	default:
+		return 0;
+	}
+
+	/* The second flash bank is stored immediately following the first
+	 * bank. Based on whether the 1st or 2nd bank is active, and whether
+	 * we want the active or inactive bank, calculate the desired offset.
+	 */
+	switch (bank) {
+	case IXGBE_ACTIVE_FLASH_BANK:
+		return offset + (second_bank_active ? size : 0);
+	case IXGBE_INACTIVE_FLASH_BANK:
+		return offset + (second_bank_active ? 0 : size);
+	}
+
+	return 0;
+}
+
+/**
+ * ixgbe_read_flash_module - Read a word from one of the main NVM modules
+ * @hw: pointer to the HW structure
+ * @bank: which bank of the module to read
+ * @module: the module to read
+ * @offset: the offset into the module in bytes
+ * @data: storage for the word read from the flash
+ * @length: bytes of data to read
+ *
+ * Read data from the specified flash module. The bank parameter indicates
+ * whether or not to read from the active bank or the inactive bank of that
+ * module.
+ *
+ * The word will be read using flat NVM access, and relies on the
+ * hw->flash.banks data being setup by ixgbe_determine_active_flash_banks()
+ * during initialization.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_read_flash_module(struct ixgbe_hw *hw,
+				   enum ixgbe_bank_select bank,
+				   u16 module, u32 offset, u8 *data, u32 length)
+{
+	u32 start;
+	int err;
+
+	start = ixgbe_get_flash_bank_offset(hw, bank, module);
+	if (!start)
+		return -EINVAL;
+
+	err = ixgbe_acquire_nvm(hw, IXGBE_RES_READ);
+	if (err)
+		return err;
+
+	err = ixgbe_read_flat_nvm(hw, start + offset, &length, data, false);
+
+	ixgbe_release_nvm(hw);
+
+	return err;
+}
+
+/**
+ * ixgbe_read_nvm_module - Read from the active main NVM module
+ * @hw: pointer to the HW structure
+ * @bank: whether to read from active or inactive NVM module
+ * @offset: offset into the NVM module to read, in words
+ * @data: storage for returned word value
+ *
+ * Read the specified word from the active NVM module. This includes the CSS
+ * header at the start of the NVM module.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_read_nvm_module(struct ixgbe_hw *hw,
+				 enum ixgbe_bank_select bank,
+				 u32 offset, u16 *data)
+{
+	__le16 data_local;
+	int err;
+
+	err = ixgbe_read_flash_module(hw, bank, IXGBE_E610_SR_1ST_NVM_BANK_PTR,
+				      offset * sizeof(data_local),
+				      (u8 *)&data_local,
+				      sizeof(data_local));
+	if (!err)
+		*data = le16_to_cpu(data_local);
+
+	return err;
+}
+
+/**
+ * ixgbe_get_nvm_css_hdr_len - Read the CSS header length
+ * @hw: pointer to the HW struct
+ * @bank: whether to read from the active or inactive flash bank
+ * @hdr_len: storage for header length in words
+ *
+ * Read the CSS header length from the NVM CSS header and add the
+ * Authentication header size, and then convert to words.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_get_nvm_css_hdr_len(struct ixgbe_hw *hw,
+				     enum ixgbe_bank_select bank,
+				     u32 *hdr_len)
+{
+	u16 hdr_len_l, hdr_len_h;
+	u32 hdr_len_dword;
+	int err;
+
+	err = ixgbe_read_nvm_module(hw, bank, IXGBE_NVM_CSS_HDR_LEN_L,
+				    &hdr_len_l);
+	if (err)
+		return err;
+
+	err = ixgbe_read_nvm_module(hw, bank, IXGBE_NVM_CSS_HDR_LEN_H,
+				    &hdr_len_h);
+	if (err)
+		return err;
+
+	/* CSS header length is in DWORD, so convert to words and add
+	 * authentication header size.
+	 */
+	hdr_len_dword = (hdr_len_h << 16) | hdr_len_l;
+	*hdr_len = hdr_len_dword * 2 + IXGBE_NVM_AUTH_HEADER_LEN;
+
+	return 0;
+}
+
+/**
+ * ixgbe_read_nvm_sr_copy - Read a word from the Shadow RAM copy
+ * @hw: pointer to the HW structure
+ * @bank: whether to read from the active or inactive NVM module
+ * @offset: offset into the Shadow RAM copy to read, in words
+ * @data: storage for returned word value
+ *
+ * Read the specified word from the copy of the Shadow RAM found in the
+ * specified NVM module.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_read_nvm_sr_copy(struct ixgbe_hw *hw,
+				  enum ixgbe_bank_select bank,
+				  u32 offset, u16 *data)
+{
+	u32 hdr_len;
+	int err;
+
+	err = ixgbe_get_nvm_css_hdr_len(hw, bank, &hdr_len);
+	if (err)
+		return err;
+
+	hdr_len = round_up(hdr_len, IXGBE_HDR_LEN_ROUNDUP);
+
+	return ixgbe_read_nvm_module(hw, bank, hdr_len + offset, data);
+}
+
+/**
+ * ixgbe_get_nvm_srev - Read the security revision from the NVM CSS header
+ * @hw: pointer to the HW struct
+ * @bank: whether to read from the active or inactive flash bank
+ * @srev: storage for security revision
+ *
+ * Read the security revision out of the CSS header of the active NVM module
+ * bank.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_get_nvm_srev(struct ixgbe_hw *hw,
+			      enum ixgbe_bank_select bank, u32 *srev)
+{
+	u16 srev_l, srev_h;
+	int err;
+
+	err = ixgbe_read_nvm_module(hw, bank, IXGBE_NVM_CSS_SREV_L, &srev_l);
+	if (err)
+		return err;
+
+	err = ixgbe_read_nvm_module(hw, bank, IXGBE_NVM_CSS_SREV_H, &srev_h);
+	if (err)
+		return err;
+
+	*srev = (srev_h << 16) | srev_l;
+
+	return 0;
+}
+
+/**
+ * ixgbe_get_nvm_ver_info - Read NVM version information
+ * @hw: pointer to the HW struct
+ * @bank: whether to read from the active or inactive flash bank
+ * @nvm: pointer to NVM info structure
+ *
+ * Read the NVM EETRACK ID and map version of the main NVM image bank, filling
+ * in the nvm info structure.
+ *
+ * Return: the exit code of the operation.
+ */
+static int ixgbe_get_nvm_ver_info(struct ixgbe_hw *hw,
+				  enum ixgbe_bank_select bank,
+				  struct ixgbe_nvm_info *nvm)
+{
+	u16 eetrack_lo, eetrack_hi, ver;
+	int err;
+
+	err = ixgbe_read_nvm_sr_copy(hw, bank,
+				     IXGBE_E610_SR_NVM_DEV_STARTER_VER, &ver);
+	if (err)
+		return err;
+
+	nvm->major = FIELD_GET(IXGBE_E610_NVM_VER_HI_MASK, ver);
+	nvm->minor = FIELD_GET(IXGBE_E610_NVM_VER_LO_MASK, ver);
+
+	err = ixgbe_read_nvm_sr_copy(hw, bank, IXGBE_E610_SR_NVM_EETRACK_LO,
+				     &eetrack_lo);
+	if (err)
+		return err;
+
+	err = ixgbe_read_nvm_sr_copy(hw, bank, IXGBE_E610_SR_NVM_EETRACK_HI,
+				     &eetrack_hi);
+	if (err)
+		return err;
+
+	nvm->eetrack = (eetrack_hi << 16) | eetrack_lo;
+
+	ixgbe_get_nvm_srev(hw, bank, &nvm->srev);
+
+	return 0;
+}
+
+/**
+ * ixgbe_get_flash_data - get flash data
+ * @hw: pointer to the HW struct
+ *
+ * Read and populate flash data such as Shadow RAM size,
+ * max_timeout and blank_nvm_mode
+ *
+ * Return: the exit code of the operation.
+ */
+int ixgbe_get_flash_data(struct ixgbe_hw *hw)
+{
+	struct ixgbe_flash_info *flash = &hw->flash;
+	u32 fla, gens_stat;
+	u8 sr_size;
+	int err;
+
+	/* The SR size is stored regardless of the NVM programming mode
+	 * as the blank mode may be used in the factory line.
+	 */
+	gens_stat = IXGBE_READ_REG(hw, GLNVM_GENS);
+	sr_size = FIELD_GET(GLNVM_GENS_SR_SIZE_M, gens_stat);
+
+	/* Switching to words (sr_size contains power of 2) */
+	flash->sr_words = BIT(sr_size) * (SZ_1K / sizeof(u16));
+
+	/* Check if we are in the normal or blank NVM programming mode */
+	fla = IXGBE_READ_REG(hw, IXGBE_GLNVM_FLA);
+	if (fla & IXGBE_GLNVM_FLA_LOCKED_M) {
+		flash->blank_nvm_mode = false;
+	} else {
+		flash->blank_nvm_mode = true;
+		return -EIO;
+	}
+
+	err = ixgbe_discover_flash_size(hw);
+	if (err)
+		return err;
+
+	err = ixgbe_determine_active_flash_banks(hw);
+	if (err)
+		return err;
+
+	err = ixgbe_get_nvm_ver_info(hw, IXGBE_ACTIVE_FLASH_BANK,
+				     &flash->nvm);
+	return err;
+}
+
 /**
  * ixgbe_read_sr_word_aci - Reads Shadow RAM via ACI
  * @hw: pointer to the HW structure
@@ -2485,7 +2990,7 @@ int ixgbe_validate_eeprom_checksum_e610(struct ixgbe_hw *hw, u16 *checksum_val)
 		if (err)
 			return err;
 
-		err = ixgbe_read_sr_word_aci(hw, E610_SR_SW_CHECKSUM_WORD,
+		err = ixgbe_read_sr_word_aci(hw, IXGBE_E610_SR_SW_CHECKSUM_WORD,
 					     &tmp_checksum);
 		ixgbe_release_nvm(hw);
 
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h
index ba8c06b73810..2c971a34200b 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_e610.h
@@ -77,5 +77,6 @@ int ixgbe_read_ee_aci_buffer_e610(struct ixgbe_hw *hw, u16 offset,
 				  u16 words, u16 *data);
 int ixgbe_validate_eeprom_checksum_e610(struct ixgbe_hw *hw, u16 *checksum_val);
 int ixgbe_reset_hw_e610(struct ixgbe_hw *hw);
+int ixgbe_get_flash_data(struct ixgbe_hw *hw);
 
 #endif /* _IXGBE_E610_H_ */
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index 3cc9760805bc..9e733a7766d9 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -11339,6 +11339,10 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		err = ixgbe_get_caps(&adapter->hw);
 		if (err)
 			dev_err(&pdev->dev, "ixgbe_get_caps failed %d\n", err);
+
+		err = ixgbe_get_flash_data(&adapter->hw);
+		if (err)
+			goto err_sw_init;
 	}
 
 	if (adapter->hw.mac.type == ixgbe_mac_82599EB)
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_type_e610.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_type_e610.h
index 617e07878e4f..cde24cbb6a82 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_type_e610.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_type_e610.h
@@ -10,7 +10,32 @@
 #define IXGBE_MAX_VSI			768
 
 /* Checksum and Shadow RAM pointers */
-#define E610_SR_SW_CHECKSUM_WORD		0x3F
+#define IXGBE_E610_SR_NVM_CTRL_WORD		0x00
+#define IXGBE_E610_SR_PBA_BLOCK_PTR		0x16
+#define IXGBE_E610_SR_NVM_DEV_STARTER_VER	0x18
+#define IXGBE_E610_SR_NVM_EETRACK_LO		0x2D
+#define IXGBE_E610_SR_NVM_EETRACK_HI		0x2E
+#define IXGBE_E610_NVM_VER_LO_MASK		GENMASK(7, 0)
+#define IXGBE_E610_NVM_VER_HI_MASK		GENMASK(15, 12)
+#define IXGBE_E610_SR_SW_CHECKSUM_WORD		0x3F
+#define IXGBE_E610_SR_PFA_PTR			0x40
+#define IXGBE_E610_SR_1ST_NVM_BANK_PTR		0x42
+#define IXGBE_E610_SR_NVM_BANK_SIZE		0x43
+#define IXGBE_E610_SR_1ST_OROM_BANK_PTR		0x44
+#define IXGBE_E610_SR_OROM_BANK_SIZE		0x45
+#define IXGBE_E610_SR_NETLIST_BANK_PTR		0x46
+#define IXGBE_E610_SR_NETLIST_BANK_SIZE		0x47
+
+/* CSS Header words */
+#define IXGBE_NVM_CSS_HDR_LEN_L			0x02
+#define IXGBE_NVM_CSS_HDR_LEN_H			0x03
+#define IXGBE_NVM_CSS_SREV_L			0x14
+#define IXGBE_NVM_CSS_SREV_H			0x15
+
+#define IXGBE_HDR_LEN_ROUNDUP			32
+
+/* Length of Authentication header section in words */
+#define IXGBE_NVM_AUTH_HEADER_LEN		0x08
 
 /* Shadow RAM related */
 #define IXGBE_SR_WORDS_IN_1KB	512
@@ -29,6 +54,14 @@
 #define IXGBE_GLNVM_FLA_LOCKED_S	6
 #define IXGBE_GLNVM_FLA_LOCKED_M	BIT(6)
 
+/* Auxiliary field, mask and shift definition for Shadow RAM and NVM Flash */
+#define IXGBE_SR_CTRL_WORD_1_M		GENMASK(7, 6)
+#define IXGBE_SR_CTRL_WORD_VALID	BIT(0)
+#define IXGBE_SR_CTRL_WORD_OROM_BANK	BIT(3)
+#define IXGBE_SR_CTRL_WORD_NETLIST_BANK	BIT(4)
+#define IXGBE_SR_CTRL_WORD_NVM_BANK	BIT(5)
+#define IXGBE_SR_NVM_PTR_4KB_UNITS	BIT(15)
+
 /* Admin Command Interface (ACI) registers */
 #define IXGBE_PF_HIDA(_i)			(0x00085000 + ((_i) * 4))
 #define IXGBE_PF_HIDA_2(_i)			(0x00085020 + ((_i) * 4))
@@ -1015,6 +1048,11 @@ struct ixgbe_aci_info {
 	enum ixgbe_aci_err last_status;	/* last status of sent admin command */
 };
 
+enum ixgbe_bank_select {
+	IXGBE_ACTIVE_FLASH_BANK,
+	IXGBE_INACTIVE_FLASH_BANK,
+};
+
 /* Option ROM version information */
 struct ixgbe_orom_info {
 	u8 major;			/* Major version of OROM */
-- 
2.47.1


